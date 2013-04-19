require 'thor'
require 'pathname'
require 'grit'

class GithubLaunch < Thor
  VERSION = "0.1.4"

  desc "network", "Open network view"
  def network; launch "/network"; end

  desc "branches", "Open branches view"
  def branches; launch "/branches"; end

  desc "pulls", "Open pull request view"
  def pulls; launch "/pulls"; end

  desc "branch BRANCH", "Open Files view for branch (defaults to current branch)"
  def branch(b=nil)
    launch "/tree/#{b || repo.head.name}"
  end

  desc "commits BRANCH", "Open Commits view for branch (defaults to current branch)"
  def commits(b=nil)
    launch "/commits/#{b || repo.head.name}"
  end

  desc "compare BASE HEAD", "Open compare page between two branches (defaults to current branch)"
  def compare(base, head=nil)
    launch "/compare/#{base}...#{head || repo.head.name}"
  end

  desc "show COMMIT", "Open a commit (defaults to last commit on current branch)"
  def show(sha=nil)
    launch "/commit/#{sha || repo.head.commit.sha}"
  end

  desc "pull BASE HEAD", "Open page to create pull request (head defaults to current branch)"
  def pull(base, head=nil)
    launch "/pull/new/#{base.sub(/\//, ":")}...#{head || repo.head.name}"
  end

  desc "version", "Displays current version"
  def version; puts VERSION; end

  private

  def repo
    @repo ||= Grit::Repo.new(repo_path)
  end

  # Finds closest git repository
  def repo_path
    @repo_path ||= Pathname.new(Dir.pwd).descend { |p| break p if (p + '.git').directory? }
  end

  # Launch (or prints) the URL
  # Ending action for most commands
  def launch(path)
    # force leading slash
    path.insert(0, '/') unless path[0] == '/'
    url = "https://github.com/#{repo_github_path + path.chomp}"
    # use open if on OSX
    if RUBY_PLATFORM.downcase.include? "darwin"
      %x{open #{url}}
    else
      puts url
    end
  end

  # <username>/<repo> for repository in pwd
  def repo_github_path
    descrip = %x{git remote -v}.match(/^.+git@github\.com:(.+\/.+)\.git/)
    raise "Could not find a Github remote" if descrip.nil?
    descrip[1]
  end
end
