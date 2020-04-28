# Description
This is a collection of scripts to be used with tmux, i3-gaps and i3blocks.

# Dependencies
* `app-emulation/libvirt` for `vm_status`
* `sys-apps/lm-sensors` for `cpu`
* `x11-misc/xkblayout-state` for `current_language`
* `media-sound/pulsemixer` for `volume`
* `media-sound/pavucontrol` for `volume`
* [`app-misc/headsetcontrol`](https://github.com/Sapd/HeadsetControl)[::nitratesky](https://github.com/SabbathHex/nitratesky) for `headset_ctl`

# Installation

There is an [ebuild](https://github.com/SabbathHex/nitratesky/blob/master/x11-misc/SH-wm-scripts/SH-wm-scripts-9999.ebuild) available in nitratesky overlay. Alternatively, the scripts may be downloaded and used on their own.

# Structure
## i3blocks
* `battery` — displays battery status. Requires battery number as the argument
* `clock` — the clock
* `cpu_temp` — cpu temp, requires an argument (see below)
* `config_repo_status` — I keep my `${HOME}/.config` as a git repository and if something is changed there and is not commited, this block appears on i3blocks bar.
* `current_language` — shows the current language using `xkblayout-state`
* `headset_ctl` — shows battery status for [compatible headphones](https://github.com/Sapd/HeadsetControl).
* `internet` — shows wifi signal strength
* `todo_next` — block for the next item in [vim todolist](https://github.com/SabbathHex/vim-todofile).
* `todo_total` — block for the total amount of items in [vim todolist](https://github.com/SabbathHex/vim-todofile).
* `vm_status` — uses `virsh` to check if VM from the argument is running
* `volume` — shows volume level and can launch `pulsemixer` and `pavucontrol`

### `cpu_temp`
cpu: requires an argument in `jq` compatible format. E.g. for the following output:
```
{
   "k10temp-pci-00c3":{
      "Adapter": "PCI adapter",
      "Tdie":{
         "temp1_input": 37.500,
         "temp1_max": 70.000
      },
      "Tctl":{
         "temp2_input": 37.500
      }
   }
}
```
the argument should be `'."k10temp-pci-00c3"."Tdie"."temp1_input" | round'` to produce output `38 C`

