# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# aliases
alias cd='z'
alias g='git add . && git commit -m'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'

# startship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# homebrew
HOMEBREW_NO_ENV_HINTS=1

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/Users/jabed/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jabed/.docker/completions $fpath)
autoload -Uz compinit
compinit

# End of Docker CLI completions
export GPG_TTY=$(tty)
