#!/usr/bin/env bash

LOCKFILE=/tmp/empty-ws-launcher.lock
exec 200>"$LOCKFILE"            # open fd 200 → lockfile
flock -n 200 || { echo "Another instance is running."; exit 1; }

# ensure that when we exit or get killed, fd 200 is closed (releasing the lock)
trap 'exec 200>&-; exit' INT TERM EXIT

declare -A ws_actions=(
  ["1"]="kitty"
  ["2"]="firefox"
  ["music"]="spotify"
  ["notes"]="obsidian"
  ["torrent"]="qbittorrent"
)

last_ws=""
last_time=0
debounce_interval=1  # seconds

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

