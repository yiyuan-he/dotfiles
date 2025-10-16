# Set up:
My personal very productive and minimal dev environment. It behaves consistently on both Linux and MacOS thanks to nvim + tmux.

## Make sure the following are installed:
- stow
- git
- neovim
- gcc
- tmux

2. Clone this repo.
```
git clone https://github.com/yiyuan-he/dotfiles.git
cd dotfiles
```

3. Run stow on neovim and tmux to generate symlinks to the configs.
```
stow neovim
stow tmux
```

At this point you would have what I consider a workable environment.

## More things to consider:
The following are not necessary but I find they drastically improve my quality of
life when working in this development environment.

- mise - Easily install languages and associated tooling through a single interface.
- zoxide - better cd
- fzf - fuzzy-finder
