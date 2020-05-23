# start tmux if it is not already running
if status is-interactive 
and not set -q TMUX
	# kills alls detached tmux sessions
	tmux list-sessions | grep -v -E -v '\(attached\)$' | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t
	exec tmux new-session
end

neofetch

# sets global editor to neovim
set -U EDITOR nvim

# aliases for setting colors
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)
set cyan (set_color cyan)
# aliases for bold colors
set bold_normal (set_color --bold normal)
set bold_magenta (set_color --bold magenta)
set bold_yellow (set_color --bold yellow)
set bold_green (set_color --bold green)
set bold_red (set_color --bold red)
set bold_gray (set_color -o --bold black)
set bold_cyan (set_color --bold cyan)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_prefix magenta
set __fish_git_prompt_color_suffix magenta
# Git Status Chars
set __fish_git_prompt_char_dirtystate "$red✗"

# disables welcome message when first starting shell
set fish_greeting ""
set fish_color_param dc86f4

# set fish_color_command 668eb7 --bold
set fish_color_command brblue --bold

# defines the prompt
function fish_prompt
    # set > color based on return 
    # status of previous command
    if test $status -eq 0
        set stat_color $bold_green
    else
        set stat_color $bold_red
    end
    
    set dir (pwd)
    echo $cyan$dir (fish_git_prompt) $stat_color'> '$normal
end

function fish_right_prompt
	# echo (set_color blue --dim) (date '+%X') 
end

# aliases 
alias push="git push origin master"
alias esl='npm i -D eslint eslint-config-airbnb-base eslint-plugin-import && touch .eslintrc.js && echo "module.exports = { extends: \"airbnb-base\" };" > .eslintrc.js'
alias init='npm init -y && esl'
alias vim='nvim'
alias vi='nvim'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias vf='vifm'
alias prun='processing-java --sketch=$PWD --run'
alias la='ls -A'
alias rm='rm -i'
# edit fish config file
alias efcf='nvim ~/.config/fish/config.fish'
# load fish config file
alias lfcf='. ~/.config/fish/config.fish'
