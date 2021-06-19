A tiny, health-oriented, command-line utility to remind you to work and stretch at regular intervals. It infinitely keeps notifying you every specified number of work and stretch durations to do those activities respectively.

## Prerequisites

- `mpv` to play the alert tone. If you use nix, `default.nix` takes care of it.

## How it works

```
[nix-shell:~/projects/work-and-stretch_build/default]$ ./work_and_stretch.exe -help
Stretch and work at regular intervals
  -work Work duration in seconds. Default is 600 seconds (= 10 minutes).
  -stretch Break duration in seconds. Default is 120 seconds (= 2 minutes).
  -help  Display this list of options
  --help  Display this list of options

[nix-shell:~/projects/work-and-stretch]$ ./_build/default/work_and_stretch.exe -work 720 -stretch 90
Work for 12m00s. Time left: 11m47s
# plays a ping after 15 minutes

Stretch for 01m30s. Time left: 01m30s
# plays a ping after 90 seconds = 1m30s

Work for 12m00s. Time left: 12m00s
# and so on, until you quit the program
```

## What should I do during stretch activity?

At the very least, get up and walk around.

Personally, I like to carry out the stretching part of the cardio + strength + stretch exercise combination. Yoga stretches are the quickest and the simplest.

## Credits

- Notification tone from: https://notificationsounds.com/message-tones/pristine-609
