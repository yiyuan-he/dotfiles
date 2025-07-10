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
set -g alt 626262      # neutral gray
set -g constant 7a9ec2 # peaceful blue
set -g comment 626262  # neutral gray for comments
set -g fg 4a4a4a       # soft charcoal
set -g func 8da474     # fresh sage for functions
set -g keyword 6d8b42  # sage green for keywords
set -g number 9e83a8   # lavender for numbers
set -g operator ca7073 # soft coral for operators
set -g property 5485b6 # calm sky blue for properties
set -g str c09553      # warm amber for strings
set -g type 8da474     # fresh sage for types

# Syntax Highlighting Colors
set -g fish_color_normal 4a4a4a
set -g fish_color_command 8da474
set -g fish_color_keyword 6d8b42
set -g fish_color_quote c09553
set -g fish_color_redirection 7a9ec2
set -g fish_color_end ca7073
set -g fish_color_error b85450
set -g fish_color_param 4a4a4a
set -g fish_color_valid_path 8da474
set -g fish_color_option 85678f
set -g fish_color_comment 626262
set -g fish_color_selection --background=ede7dc
set -g fish_color_operator ca7073
set -g fish_color_escape 6d8b42
set -g fish_color_autosuggestion 626262
set -g fish_color_cwd c09553
set -g fish_color_hostname 9e83a8
set -g fish_color_status b85450
set -g fish_color_cancel 9e83a8
set -g fish_color_search_match --background=ede7dc

# Completion Pager Colors
set -g fish_pager_color_progress 85678f
set -g fish_pager_color_prefix 8da474
set -g fish_pager_color_completion 4a4a4a
set -g fish_pager_color_description 626262
set -g fish_pager_color_selected_prefix 6d8b42
set -g fish_pager_color_selected_completion 6d8b42
set -g fish_pager_color_selected_background --background=ede7dc

# FZF Light Theme Colors - Matching Sun Mage palette
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--color=fg:#4a4a4a,bg:#faf8f3,hl:#5485b6,gutter:#faf8f3
--color=fg+:#4a4a4a,bg+:#ede7dc,hl+:#6d8b42
--color=info:#7a9ec2,prompt:#5485b6,pointer:#9e83a8
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
