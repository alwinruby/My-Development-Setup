# MacOS Dev Environment

* This is my personal Mac setup, and I'll continue to add and edit things as I discover them!
* This development environment involves Ruby, Sinatra, Rails, Python, Node.js, Heroku, and 
general development tools I find useful
* Current as of macOS Sierra v.10.12.4

# Essential Programs & Tools

## [Homebrew](https://brew.sh/)
Homebrew is the missing package manager for macOS, and makes installing and updating software a cakewalk. It really gives Apt-Get and Yum a run for their money, and is arguably better in many ways. Install is super easy, just pop open a terminal and run the command below. We'll start using Homebrew for the majority of the software on this list.
 ```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
## [Git](https://git-scm.com/)
What would a dev environment be without Git?! Git is the defacto version control system for developers.
```bash
brew install git
```
After a fresh install of Git, it's important to set your global variables, so you can make commits with identification. Run the following, inserting your email and name.
```bash
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
```




