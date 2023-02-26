alias please='sudo'
alias dhfm='nohup vlc --one-instance http://digitalhits.frilab.com:8000/digitalhits </dev/null &>/dev/null &'
alias lofi='nohup vlc --one-instance --no-video https://www.youtube.com/watch\?v\=jfKfPfyJRdk </dev/null &>/dev/null &'
alias logoff='qdbus org.kde.ksmserver /KSMServer logout 1 3 3'

alias sl='echo I think you misspelled it... ; ls'

# hide snap
alias df='df -x"squashfs"'
command -v nvim >/dev/null && alias vim='nvim'

if command -v codium >/dev/null; then
  alias code='codium'
  alias vscode='codium'
fi

alias azls='az account list -o table'
alias azset='az account set --subscription'

alias tf='terraform'
alias tfp='terraform plan -parallelism=20 -out tfplan'
alias tfap='terraform apply -parallelism=20 tfplan'

alias scrcpy="scrcpy --encoder 'OMX.google.h264.encoder' -S -m 1280"
