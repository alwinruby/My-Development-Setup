# MacOS Dev Environment

* This is my personal Mac setup, and I'll continue to add and edit things as I discover them!
* Current as of macOS HighSierra v.10.13.3

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
brew 'fish'
brew 'gradle'
brew 'nasm'
brew 'dosbox'
brew 'tldr'
brew 'git'
brew 'sqlite3'
brew 'mysql', restart_service: true
brew 'crystal-lang'
brew 'curl'
brew 'maven'
brew 'node'
brew 'vim'
brew 'wget'
brew 'npm'
brew 'python3'
brew 'docker'


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

## [Fish Shell](https://fishshell.com/)
Fish is a fantastic replacement for Bash, with smart autocompletion and syntax highlighting enabled out of the box. It shows when you're currently in a git repo, what branch, and if the branch is dirty or clean. It has a nice web GUI for setting themes, and it head and shoulders easier to set up than Zsh, and is more flexible than Bash. We'll use Homebrew to install fish, and the syntax is very intuitive.
```bash
brew install fish
```
Next is changing the default shell to use Fish instead of Bash, through the chsh command.
```bash
chsh -s `which fish`
```
And if you'd ever like to return to the world of Bash, just run the following. Slightly different syntax than Bash.
```bash
chsh -s (which bash)
```
Another nifty trick is to set an Alias for all of your Homebrew commands to simplify updating and cleaning your package manager. First navigate to ~/.config/fish/config.fish  If the file does not exist, go ahead and create it. This is the Fish equivalent of a .bashrc, which runs a set of commands each time your shell starts up. Add the following line to your config.fish
```bash
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
```
Now you have a single command that does the work of 5 commands! I reccomend running this at least once a day, just to make sure you have the lastest of everything you install with Brew
```bash
brewup
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
gem 'rest-client'
gem 'sequel'
gem 'rubocop'
gem 'colorize'
gem 'monetize'
gem 'money'
gem 'slop'
gem 'os'
```

## [Hyper.js](https://hyper.is/)
Hyper is a terminal replacement based on the same electron framework as Atom. It allows for deep customization and plugin creation, and is hackable to the core. iTerm2 is another good replacement for Hyper, but IMO Hyper looks better. Either represent an extreme improvement over the default MacOS terminal.
```bash
brew cask install hyper
```
