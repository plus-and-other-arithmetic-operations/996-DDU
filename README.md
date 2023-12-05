# 996-DDU
Commission for Aftershock's OLD&NEW 996.

## DDU10 Breakdown (by zee)

https://github.com/plus-and-other-arithmetic-operations/996-DDU/assets/88043761/cd5e22d2-5cdf-45f3-b32a-a0d101affe63

Some stuff was scrapped, but most functions are mapped

![Untitled_Artwork](https://github.com/plus-and-other-arithmetic-operations/996-DDU/assets/88043761/0c015c03-0117-40ef-84d1-f0adbca74888)

![Untitled_Artwork2](https://github.com/plus-and-other-arithmetic-operations/996-DDU/assets/88043761/6aa9d67a-44be-473c-8f03-184107d029f5)

Some features:

- Dynamic selected boost %
- Dynamic selected brake bias
- Boost pressure bar
- Best & last lap
- Lap number
- Laps remaining (according to fuel left in car)
- Gear & speed display
- % of fuel remaining
- Engine & tyre temps
- Dynamic ABS & TC selection info
- Multicolored RPM LED, working with a pit limiter
- ABS & Wheel slip LED's, working with turnsignals
- Dynamic tyre compound display

## Setup

Add the script entry into the car's ext_config

```ini
[SCRIPTABLE_DISPLAY_...]
ACTIVE = 1
RESOLUTION = 1024, 1024
DISPLAY_POS = 0,0  
DISPLAY_SIZE = 1024, 1024
SKIP_FRAMES = 0
MESHES = DDU_LED
SCRIPT = leds.lua

[SCRIPTABLE_DISPLAY_...]
ACTIVE = 1
RESOLUTION = 1024, 1024
DISPLAY_POS = 0,0  
DISPLAY_SIZE = 1024, 1024
SKIP_FRAMES = 0
MESHES = PIVOT_DIGI
SCRIPT = digigauge.lua
```

