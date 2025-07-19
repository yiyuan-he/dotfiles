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

# Sun Mage Fish Colors - Focus-enhancing light theme

# Color variables for semantic use
set -g alt 4a4a4a      # darker gray
set -g constant 5a7ea2 # darker blue
set -g comment 4a4a4a  # darker gray for comments
set -g fg 1a1a1a       # very dark charcoal
set -g func 4d6b22     # darker sage for functions
set -g keyword 2a4d0e  # much darker sage green for keywords
set -g number 7e6388   # darker lavender for numbers
set -g operator aa5053 # darker coral for operators
set -g property 345596 # darker sky blue for properties
set -g str a07533      # darker amber for strings
set -g type 4d6b22     # darker sage for types

# Syntax Highlighting Colors
set -g fish_color_normal 1a1a1a
set -g fish_color_command 65476f
set -g fish_color_keyword 2a4d0e
set -g fish_color_quote a07533
set -g fish_color_redirection aa5053
set -g fish_color_end aa5053
set -g fish_color_error 985030
set -g fish_color_param 1a1a1a
set -g fish_color_valid_path a07533
set -g fish_color_option 65476f
set -g fish_color_comment 4a4a4a
set -g fish_color_selection --background=ede7dc
set -g fish_color_operator aa5053
set -g fish_color_escape 2a4d0e
set -g fish_color_autosuggestion 4a4a4a
set -g fish_color_cwd a07533
set -g fish_color_hostname 7e6388
set -g fish_color_status 985030
set -g fish_color_cancel 7e6388
set -g fish_color_search_match --background=ede7dc

# Completion Pager Colors
set -g fish_pager_color_progress 65476f
set -g fish_pager_color_prefix 65476f
set -g fish_pager_color_completion 1a1a1a
set -g fish_pager_color_description 4a4a4a
set -g fish_pager_color_selected_prefix 65476f
set -g fish_pager_color_selected_completion 65476f
set -g fish_pager_color_selected_background --background=ede7dc

# FZF Light Theme Colors - Matching Sun Mage palette
set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#2a2a2a,bg:#faf8f3,hl:#5485b6,gutter:#faf8f3 \
--color=fg+:#1a1a1a,bg+:#ede7dc,hl+:#6d8b42 \
--color=info:#7a9ec2,prompt:#5485b6,pointer:#9e83a8 \
--color=marker:#5485b6,spinner:#5485b6,header:#5485b6"

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

alias claude="/Users/yiyuanh/.claude/local/claude"
