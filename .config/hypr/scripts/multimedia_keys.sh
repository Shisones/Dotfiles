#!/bin/bash

# Function to get current volume percentage
get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

# Function to get current brightness percentage
get_brightness() {
    brightnessctl -m | awk -F, '{print int($4)}'
}

# Function to check mute status
get_mute_status() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "Muted" || echo "Unmuted"
}

# Function to check mic mute status
get_mic_mute_status() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED && echo "Muted" || echo "Unmuted"
}

# Handle key bindings
case "$1" in
    "volume_up")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        VOLUME=$(get_volume)
        notify-send -e -r 1000 -t 1000 -i audio-volume-high -h string:synchronous:volume -h int:value:"$VOLUME" "Volume" "$VOLUME%"
        ;;
    "volume_down")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        VOLUME=$(get_volume)
        notify-send -e -r 1000 -t 1000 -i audio-volume-high -h string:synchronous:volume -h int:value:"$VOLUME" "Volume" "$VOLUME%"
        ;;
    "volume_up_fine")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
        VOLUME=$(get_volume)
        notify-send -e -r 1000 -t 1000 -i audio-volume-high -h string:synchronous:volume -h int:value:"$VOLUME" "Volume" "$VOLUME%"
        ;;
    "volume_down_fine")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
        VOLUME=$(get_volume)
        notify-send -e -r 1000 -t 1000 -i audio-volume-high -h string:synchronous:volume -h int:value:"$VOLUME" "Volume" "$VOLUME%"
        ;;
    "mute")
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        STATUS=$(get_mute_status)
        notify-send -e -r 1000 -t 1000 -i audio-volume-muted -h string:synchronous:volume "Volume" "$STATUS"
        ;;
    "mic_mute")
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        STATUS=$(get_mic_mute_status)
        notify-send -e -r 1000 -t 1000 -i microphone-sensitivity-muted -h string:synchronous:volume "Microphone" "$STATUS"
        ;;
    "brightness_up")
        brightnessctl s 5%+
        BRIGHTNESS=$(get_brightness)
        notify-send -e -r 1000 -t 1000 -i display-brightness-symbolic -h string:synchronous:brightness -h int:value:"$BRIGHTNESS" "Brightness" "$BRIGHTNESS%"
        ;;
    "brightness_down")
        brightnessctl s 5%-
        BRIGHTNESS=$(get_brightness)
        notify-send -e -r 1000 -t 1000 -i display-brightness-symbolic -h string:synchronous:brightness -h int:value:"$BRIGHTNESS" "Brightness" "$BRIGHTNESS%"
        ;;
    "media_next")
        playerctl next
        notify-send -e -r 1000 -t 1000 -i media-skip-forward -h string:synchronous:playerctl "Media" "Next Track"
        ;;
    "media_play_pause")
        playerctl play-pause
        STATUS=$(playerctl status 2>/dev/null && echo "Play/Pause" || echo "Play/Pause")
        notify-send -e -r 1000 -t 1000 -i media-playback-start -h string:synchronous:playerctl "Media" "$STATUS"
        ;;
    "media_prev")
        playerctl previous
        notify-send -e -r 1000 -t 1000 -i media-skip-backward -h string:synchronous:playerctl "Media" "Previous Track"
        ;;
esac
