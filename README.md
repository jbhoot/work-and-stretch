A tiny, health-oriented, command-line utility to remind you to work and stretch at regular intervals. It infinitely keeps notifying you every specified number of work and stretch durations to do those activities respectively.

## Prerequisites

- `mpv` to play the alert tone. If you use nix, `default.nix` takes care of it.

## How it works

```
[nix-shell:~/projects/work-and-stretch/_build/default]$ ./work_and_stretch.exe --help
Stretch and work at regular intervals
  --work Work duration in minutes. Default is 10 minutes.
  --stretch Break duration in minutes. Default is 2 minutes.
  -help  Display this list of options
  --help  Display this list of options
  
[nix-shell:~/projects/work-and-stretch/_build/default]$ ./work_and_stretch.exe --work 15 --stretch 3
Work for 15 minutes
# plays a ping after 15 minutes
Stretch for 3 minutes
# plays a ping after 3 minutes
Work for 15 minutes
# and so on, until you quit the program
```

## What should I do during stretch activity?

At the very least, get up and walk around.

Personally, I like to carry out the stretching part of the cardio + strength + stretch exercise combination. Yoga stretches are the quickest and the simplest.

## Credits

- Notification tone from: https://notificationsounds.com/message-tones/pristine-609
