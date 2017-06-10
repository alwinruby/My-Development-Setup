# MacOS Dev Environment

* This is my personal Mac setup, and I'll continue to add and edit things as I discover them!
* This development environment involves Ruby, Sinatra, Rails, Crystal, Heroku, and
general development tools I find useful
* Current as of macOS Sierra v.10.12.5

# Essential Programs & Tools

## [Homebrew](https://brew.sh/)
Homebrew is the missing package manager for macOS, and makes installing and updating software a cakewalk. It really gives Apt-Get and Yum a run for their money, and is arguably better in many ways. Install is super easy, just pop open a terminal and run the command below. We'll start using Homebrew for the majority of the software on this list.
 ```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## [ZSH Shell](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
ZSH or Z-Shell is a fantastic replacement for Bash. It gives you powerful autocompletions, and can be configured with tons of custom plugins, themes, and components, through a tool such as Oh-My-Zsh.
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

## [Git](https://git-scm.com/)
What would a dev environment be without Git? Git is the defacto version control system for developers.
```bash
brew install git
```
After a fresh install of Git, it's important to set your global variables, so you can make commits with identification. Run the following, inserting your email and name.
```bash
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
```
