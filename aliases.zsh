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

# egoist/bina - github.com/OWNER/NAME@v1.2.3
_bina() { curl -fsSL "https://bina.egoist.dev/$@" | sh; }
alias bina=_bina

PIPER="/opt/piper/piper"
if [ -f "${PIPER}" ]; then
  PIPER_MODEL="`dirname ${PIPER}`/ca-upc_ona-x-low.onnx"
  _piper(){ echo "$@" | ${PIPER} -m ${PIPER_MODEL} --output_raw | aplay -f S16_LE -c 1 -r 16000 2>/dev/null };
  alias piper=_piper
fi
