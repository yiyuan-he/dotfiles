status is-interactive; and begin
# Aliases
alias ls eza
alias vim nvim
alias z zoxide

set fish_greeting ""

# Interactive shell initialisation
# Make nix available in fish so we can find packages and use cli commands
set -gx PATH $HOME/.nix-profile/bin $HOME/.nix-profile/sbin $PATH
set -gx PATH /nix/var/nix/profiles/default/bin /nix/var/nix/profiles/default/sbin $PATH

# Set default editor to nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# Ghostty Default Color Palette
set -l foreground ffffff
set -l background 282c34
set -l selection 666666
set -l comment 666666
set -l red cc6666
set -l orange e7c547
set -l yellow f0c674
set -l green b5bd68
set -l purple b294bb
set -l cyan 8abeb7
set -l pink c397d8

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#666666 \
  --color=bg:#282c34 \
  --color=border:#8abeb7 \
  --color=fg:#ffffff \
  --color=gutter:#282c34 \
  --color=header:#e7c547 \
  --color=hl+:#81a2be \
  --color=hl:#81a2be \
  --color=info:#666666 \
  --color=marker:#cc6666 \
  --color=pointer:#cc6666 \
  --color=prompt:#81a2be \
  --color=query:#ffffff:regular \
  --color=scrollbar:#8abeb7 \
  --color=separator:#e7c547 \
  --color=spinner:#cc6666 \
"

starship init fish | source
zoxide init fish | source

/Users/yiyuanh/.local/bin/mise activate fish | source
end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/yiyuanh/.opam/opam-init/init.fish' && source '/Users/yiyuanh/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
