## 2024-02-20

The AMD 5900x issues I had been experiencing with repeated restarts and instability was completely by setting the PCIE
speed to `gen3` in the BIOS from the default value of `auto`. The issue was thus not related the many other things I
tested: 

* Updated BIOS
* Updated chipset drivers
* Extra cooling by adding more Noctua fans etc. 
* Updated PSU in case the current version could not support the higher power draw from the CPU
* Disabled XMP profiles in BIOS and other BIOS settings related to low-power states. 

See reddit thread: https://www.reddit.com/r/ryzen/comments/18rcs6u/comment/kf2qklg/ from
https://www.reddit.com/r/ryzen/comments/18rcs6u/ryzen_9_5900x_issues/
