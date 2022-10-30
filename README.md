### Dotfiles

Clone into `$HOME` then simply call run `./install`. Install script requires [stow](https://www.gnu.org/software/stow/). Right now install script is kind of pointless, because it's a one-liner.

### Todo

- [ ] Find out a way to install all the plugins via install script. Otherwise I have to use `pcall` everywhere I need to require a module which is only necessary for the first time that nvim is run on a machine.
