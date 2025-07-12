#!/bin/bash

declare -A ws_actions=(
  ["d*"]="kitty"
  ["w*"]="firefox"
  ["e*"]="thunar"
  ["x0"]="spotify"
  ["z0"]="/usr/bin/firefox --name='Whatsapp' --no-remote -P 'FTWA' 'https://web.whatsapp.com/'"
  ["notes"]="flatpak run md.obsidian.Obsidian"
  ["torrent"]="qbittorrent"
)

last_ws=""
last_time=0
debounce_interval=2  # seconds

exec 3< <(swaymsg -m -t subscribe '["workspace"]' | jq -c --unbuffered '.')

while IFS= read -r -u 3 _event; do
  focused_empty_ws=$(swaymsg -t get_tree | jq -r '
    .. | objects
    | select(
      .type? == "workspace"
      and .focused == true
      and (.nodes == [] and .floating_nodes == [])
    )
    | .name
  ')

  now=$(date +%s)

  if [[ -n "$focused_empty_ws" ]] && { [[ "$focused_empty_ws" != "$last_ws" ]] || (( now - last_time >= debounce_interval )); }; then

    matched_cmd=""

    # First try exact match
    if [[ -n "${ws_actions[$focused_empty_ws]}" ]]; then
      matched_cmd="${ws_actions[$focused_empty_ws]}"
    else
      # Try glob patterns
      for pattern in "${!ws_actions[@]}"; do
        if [[ "$focused_empty_ws" == $pattern ]]; then
          matched_cmd="${ws_actions[$pattern]}"
          break
        fi
      done
    fi

    if [[ -n "$matched_cmd" ]]; then
      echo "Empty workspace \"$focused_empty_ws\" → launching: $matched_cmd"
      sway exec "$matched_cmd" 
      last_ws="$focused_empty_ws"
      last_time=$now
    fi
  fi
done
