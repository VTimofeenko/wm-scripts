#!/bin/sh

NOTIFICATION_ID_LOCATION=${XDG_CACHE_DIR}/dunst/
NOTIFICATION_PAUSE_ID_FILE="${NOTIFICATION_ID_LOCATION}"/close_toggle_notification_id

[ -d "$NOTIFICATION_ID_LOCATION" ] || mkdir "$NOTIFICATION_ID_LOCATION"

CURRENT_STATE=$(dunstctl is-paused)

if [ "$CURRENT_STATE" = "false" ]; then
    dunstify -p -i "notification-disabled-symbolic" --appname="Dunst" "Notifications paused" > "$NOTIFICATION_PAUSE_ID_FILE"
    sleep 1
else
    NOTIFICATION_ID=$(cat "$NOTIFICATION_PAUSE_ID_FILE")
    dunstify -r "${NOTIFICATION_ID}" -i "notification-symbolic" --appname="Dunst" "Notifications unpaused"
fi

dunstctl set-paused toggle
