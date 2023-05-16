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

function gpt() {
  if [ -z "$OPENAI_API_KEY" ]; then
    echo "[!] OPENAI_API_KEY is empty."
    return
  fi

  # Set the model name
  #MODEL_NAME="davinci"
  MODEL_NAME="gpt-3.5-turbo"

  # Get user input
  local query="$*"

  # Call the OpenAI API to get a response
  # NOTE: QUERY and ENDPOINT ARE DIFFERENT!
  # davinci model uses "prompt". gpt-3.5-turbo uses "messages".

  if [ "$MODEL_NAME" = "davinci" ]; then
    local endpoint="completions"
    local body_data="{\"model\": \"$MODEL_NAME\", \"prompt\": \"$query\", \"max_tokens\": 100}"
    local response_query=".choices[].text"
  elif [ "$MODEL_NAME" = "gpt-3.5-turbo" ]; then
    local endpoint="chat/completions"
    local body_data="{\"model\": \"$MODEL_NAME\", \"messages\": [{\"role\": \"system\", \"content\": \"You are a helpful assistant.\"}, {\"role\": \"user\", \"content\": \"$query\"}]}"
    local response_query=".choices[].message.content"
  fi
  local response=$(mktemp --tmpdir gpt.XXXXXXXX)
  curl -s -X POST \
    --output $response \
    --fail \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d $body_data \
    "https://api.openai.com/v1/$endpoint"

  # Check for errors in the response
  local error=$(jq -r ".error" $response)
  if [[ "$error" != "null" ]]; then
      local error_message=$(jq -r ".error.message" $response)
      echo "Error: $error_message"
      [ -z "$DEBUG" ] && rm -f $response
      return 1
  fi

  # Extract the generated text from the API response
  local completion=$(jq -r $response_query $response)

  # Print the completion
  echo "> $completion"
  [ -z "$DEBUG" ] && rm -f $response
}
