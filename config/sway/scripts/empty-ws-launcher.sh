#!/usr/bin/env bash

declare -A ws_actions=(
  ["1"]="kitty"
  ["2"]="firefox"
  ["music"]="spotify"
  ["notes"]="obsidian"
  ["torrent"]="qbittorrent"
  ["extra"]="kitty ~/"
  ["file-manager"]="thunar"
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

  if [[ -n "$focused_empty_ws" ]] \
     && [[ -n "${ws_actions[$focused_empty_ws]}" ]] \
     && { [[ "$focused_empty_ws" != "$last_ws" ]] || (( now - last_time >= debounce_interval )); }
  then
    cmd="${ws_actions[$focused_empty_ws]}"
    echo "Empty workspace \"$focused_empty_ws\" → launching: $cmd"
    sh -c "$cmd" &
    last_ws="$focused_empty_ws"
    last_time=$now
  fi
done

