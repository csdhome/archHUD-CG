# ArchHUD v2.105-CG — The Consortium Edition

A full-featured flight HUD with autopilot, fuel tracking, orbital mechanics, PvP awareness, and shield management. Customized for The Consortium MyDU server.

## Installation

ArchHUD uses Lua `require()` to load its modules at runtime, so you need to install both the autoconf file and the module files.

### Step 1: Copy the Atlas

Copy the Consortium atlas file to your DU autoconf directory:

```
atlas.lua  -->  <DU Install>/Game/data/lua/autoconf/custom/atlas.lua
```

The atlas file is located at: `FlightHuds/AtlasFile-main/AtlasFile-main/atlas.lua`

### Step 2: Copy the HUD Modules

Copy the entire `src/requires/` folder contents into the archhud autoconf subdirectory:

```
src/requires/*.lua  -->  <DU Install>/Game/data/lua/autoconf/custom/archhud/
```

The following files should be in `autoconf/custom/archhud/`:
- `globals.lua`
- `hudclass.lua`
- `apclass.lua`
- `controlclass.lua`
- `atlasclass.lua`
- `baseclass.lua`
- `shieldclass.lua`
- `radarclass.lua`
- `axiscommandoverride.lua`
- `fueltankdefinitions.lua`

### Step 3: Install the Autoconf

Copy the main conf file:

```
ArchHUD.conf  -->  <DU Install>/Game/data/lua/autoconf/custom/ArchHUD.conf
```

### Step 4: Activate In-Game

1. Right-click your cockpit, command seat, or programming board
2. Go to **Advanced** > **Select autoconf**
3. Choose **ArchHud - Consortium v2.105-CG**

### Required Linked Elements

ArchHUD will auto-detect and link these elements:
- **Core Unit** (required)
- Radar (PvP radar, manual select)
- Anti-Gravity Generator
- Warp Drive
- Gyroscope
- Weapons (manual select)
- Databank (for saving settings, manual select)
- Telemeter (manual select)
- Vertical Boosters
- Hover Engines
- Shield Generator
- Screen (for HUD display, manual select)
- Transponder
- Fuel Tanks (atmo, space, rocket — manual select)

### Default Install Path

The typical DU install path is:
```
C:\ProgramData\Dual Universe\Game\data\lua\autoconf\custom\
```

### Consortium-Specific Features

- All Consortium planets and moons in the atlas (including Prime planets, CG meganodes, Consortium Home World)
- Fuel tank support for XS through XXL sizes, tiers T1-T5, Standard/Optimised/Gravity-Inverted
- Speed limits set to 50,000 km/h (server max)
- Safe zone radius: 64,000,000 meters
- Space engine minimum altitudes for all Consortium atmospheric bodies
