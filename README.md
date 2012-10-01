# Github Launch

I find Github's web interface very powerful and familiar, so I created a
tool to help launch common Github URLs from the command-line.

It doesn't do anything fancy or even use the API. It just builds &
launches Github URLs to help save time and/or a bunch of bookmarks.

It is mostly intended for OSX where the `open` command launches the
default browser. Currently, on other platforms the URL will be printed
instead.

Built with [Thor] and [Grit]. Pull Requests welcome!

## Usage

Here is some example usage:

```bash
# Open page for specific commit
$ ghl show 1d780099df

# Open page for last commit
$ ghl show

# Open file browser for specific branch
$ ghl branch topic123

# Open file browser for current branch
$ ghl branch

# Open the Network view
$ ghl network

# Open page to create pull request from current branch to master
$ ghl pull master
```

Be sure to check out the help via `ghl help` for full command listing.

## Installation

githublaunch is [hosted on rubygems][githublaunch] and can be installed
via `gem`:

```bash
gem install githublaunch
```

## License

githublauncher is licensed under the MIT license. See [LICENSE]
for more details


[githublaunch]: https://rubygems.org/gems/githublaunch
[Thor]: https://rubygems.org/gems/thor
[Grit]: https://rubygems.org/gems/grit
[LICENSE]: http://raw.github.com/loganlinn/githublauncher/master/LICENSE
