if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
PATH=$PATH:$(go env GOPATH)/bin/
export PATH

HISTFILE=~/.zsh_history

# function zle-keymap-select zle-line-init
# {
#     # change cursor shape in iTerm2
#     case $KEYMAP in
#         vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
#         viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
#     esac
# 
#     zle reset-prompt
#     zle -R
# }
# 
# function zle-line-finish
# {
#     print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
# }
# 
# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey  '^[[H'   beginning-of-line
bindkey  '\e[F'   end-of-line
bindkey  '\e[3~'  delete-char
#bindkey -v '^?' backward-delete-char
unsetopt nomatch

eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
