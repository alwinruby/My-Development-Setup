# MacOS Dev Environment

* This is my personal Mac setup, and I'll continue to add and edit things as I discover them!
* This development environment involves Ruby, Crystal, Sinatra, Rails, Heroku, Vue.js and
general development tools I find useful
* Current as of macOS Sierra v.10.12.6

# My Programs & Tools

## [Visual Studio Code](https://code.visualstudio.com/)

## [Homebrew](https://brew.sh/)
Homebrew is the missing package manager for macOS, and makes installing and updating software a cakewalk. It really gives Apt-Get and Yum a run for their money, and is arguably better in many ways. We'll start using Homebrew for the majority of the software on this list. Install is simple, just pop open a terminal and run the command below.
 ```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

UPDATE: A recently added feature to Homebrew allows you to install all the software and apps you need by listing the in a single "Brewfile" and running "brew bundle install". This is convienient and fast approach to installing mass amounts of software on a new mac, saving lots of time. My brewfile is listed below, but I'll show how to install each of the tools below through brew as a secondary option.
### Brewfile
```bash
tap 'caskroom/cask'

# Core Homebrew
cask 'java'
brew 'git'
brew 'sqlite3'
brew 'mysql', restart_service: true
brew 'crystal-lang'
brew 'curl'
brew 'maven'
brew 'node'
brew 'scala'
brew 'vim'
brew 'wget'
brew 'npm'
brew 'python3'
brew 'docker'
brew 'heroku'


# Cask Apps
cask 'google-chrome'
cask 'sequel-pro'
cask 'filezilla'
cask 'spotify'
cask 'atom'
cask 'hyper'
cask 'postman'
cask 'eclipse-java'
cask 'google-drive'
cask 'sqlitebrowser'
cask 'microsoft-office'

# Mac app store
mas 'GIPHY CAPTURE', id: 668208984
mas 'The Unarchiver', id: 425424353
mas 'BetterSnapTool', id: 417375580
mas 'Battery Monitor', id: 836505650
```

## [ZSH-Shell](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
ZSH or Z-Shell is a fantastic replacement for Bash. It gives you powerful autocompletions, and can be configured with tons of custom plugins, themes, and components, through a tool such as Oh-My-Zsh. I previously used Fish, but had issues with POSIX compatibility, which is a non issue with ZSH. ZSH gives you more flexibility in the end to make it your own, instead or relying on out of the box functionality.
```bash
brew install zsh zsh-completions
```
Next is changing the default shell to use ZSH instead of Bash, through the chsh command.
```bash
chsh -s `which zsh`
```
And if you'd ever like to return to the world of Bash, just run the following.
```bash
chsh -s `which bash`
```
Another nifty trick is to set an Alias for all of your Homebrew commands to simplify updating and cleaning your package manager. First navigate to ~/.zshrc  If the file does not exist, go ahead and create it. This is the ZSH equivalent of a .bashrc, which runs a set of commands each time your shell starts up. Add the following line to your .zshrc
```bash
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
```
Now you have a single command that does the work of 5 commands! I usually run this once a day or so, just to make sure everything is working as it should.
```bash
brewup
```

## [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
Oh-My-Zsh is a framework for managing your ZSH config, it manages plugins, themes, prompts, and all kinds of neat stuff. It has a thriving community surrounding it. With 200+ plugins, and 140+ themes, you can really make the shell fit your specific personal needs, to make you more productive!

Install is very straightforward, it clones from github, and makes a new compy of your .zshrc
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Next step is to set any plugins you'd like to use, these are set in the .zshrc, in the section below
```bash
plugins=(git bundler osx rake ruby)
```
Last step is setting a theme, which is set in the section below
```bash
ZSH_THEME="robbyrussell"
```
Here's a list of all the themes => [Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/themes)


## [ZSH Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
This plugin extends the functionality of ZSH to make autosuggestions while you type, based on previous command history

1. It installs like any other plugin for zsh, first, cloning into the .oh-my-zsh folder
```bash
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
2. Add the plugin to the list of plugins for Oh-My-Zsh to load
```bash
plugins=(zsh-autosuggestions)
```
Then start a new terminal session to see the changes


## [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-autosuggestions)
This is probably my favorite ZSH plugin of all time, and it looks the coolest by far. This plugin highlights the commands as you type, so you can easily catch spelling errors, mistakes, or incorrect path destinations.

1. This install is slightly different, but start by cloning the repo:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
2. Make sure the file is sourced at the bottom of your .zshrc, if not, add the following:
```bash
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```


## [Git-Version Control](https://git-scm.com/)
What would a dev environment be without Git? Git is the defacto version control system for developers.
```bash
brew install git
```
After a fresh install of Git, it's important to set your global variables, so you can make commits with identification. Run the following, inserting your email and name.
```bash
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
```


## [Ruby-Version-Manager - RVM](https://rvm.io/)
"RVM or Ruby Version Manager, is a command line tool that allows you to easily install, manage, and work with multiple ruby environments"

TLDR  =>  Keeps different versions of Ruby in line, and makes sure that your system version of ruby isn't messed with.

1. Run the following to add the public authentication keys
```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```
2. This command actually installs that stable version of rvm
```bash
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```
3. After this finishes, restart the terminal and check the following:
```bash
which ruby
```
Which should output something similar =>
```bash
/Users/jake/.rvm/rubies/ruby-2.4.0/bin/ruby
```
See the [RVM website](https://rvm.io/) for more details regarding different versions of ruby

### Gems
This is a list of gems I use regularly in ruby, mostly for small applications, I have these gems installed globally, so I don't have to worry about running bundler on small ruby scripts
1. Install gems with the following syntax:
```bash
gem install rails
```
2. List of all the gems I use
```bash
gem 'sinatra'
gem 'rails'
gem 'twilio-ruby'
gem 'rest-client'
gem 'sequel'
gem 'rubocop'
gem 'sinatra-subdomain'
gem 'sinatra-json'
```

## [MariaDB](https://mariadb.org/)
MariaDB is an open source database created by the original team that developed mySQL. It's technically a fork of mySQL, with drop in compatibility ensured with mySQL tooling. Lately, Oracle hasn't been maintaining mySQL like they should, so they created an open source variant that has a large community following it. New features are always being released, and with compatibility promised, it posed little risk to try out.

1. MariaDB has detailed install instructions [here](https://mariadb.com/kb/en/mariadb/installing-mariadb-on-macos-using-homebrew/) but the following is a condensed version.
```bash
brew install mariadb
```
```bash
brew services start mariadb
```

This should install the database, and start the server. After running both, you should be able to login to the server. Default user is root with no passoword.

## [Vue.js](https://vuejs.org/)
Vue.js is a javascript framework that allows for a streamlined development process of single page web applications, or anything else. It's extremely light, and runs faster than any competing frameworks like Angular, React, or Ember. The javascript and templating syntax is intuitive, easy to learn, and powerful, allowing for quick development and deployment. It's focus in on the view layer only, so you would need to rely on other libraries to route traffic around, or have it consume a json api.

1. Install requires npm or "node package manager", so make sure it's installed by running the following:
```bash
brew install node
brew install npm
```
2. Using npm, install vue and the cli tools for building an app easily.
```bash
npm install --global vue-cli
```

The website has a fantastic [guide](https://vuejs.org/v2/guide/) that walks through the basics of syntax, the cli tools, and more. Be sure to check it out.

## [Hyper.js](https://hyper.is/)
Hyper is a terminal replacement based on the same electron framework as Atom. It allows for deep customization and plugin creation, and is hackable to the core. iTerm2 is another good replacement for Hyper, but IMO Hyper looks better. Either represent an extreme improvement over the default MacOS terminal.
```bash
brew cask install hyper
```
