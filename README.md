### Dotfiles

```
> cd $HOME && git clone https://github.com/andreyuhai/.dotfiles.git && $HOME/.dotfiles/install
```

Install script requires [stow](https://www.gnu.org/software/stow/). Right now install script is kind of pointless, because it's a one-liner.

(_For Elixir language server and other language servers, don't forget to put them under bin with the appropriate name_)

Note: Well of course don't forget to run :PackerInstall afterwads :facepalm:

### Todo

- [ ] Find out a way to install all the plugins via install script. Otherwise I have to use `pcall` everywhere I need to require a module which is only necessary for the first time that nvim is run on a machine.
