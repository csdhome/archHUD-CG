# ArchHUD v2.106-CG — The Consortium Edition

A full-featured flight HUD with autopilot, fuel tracking, orbital mechanics, PvP awareness, and shield management. Customized for The Consortium MyDU server.

## Installation

ArchHUD uses Lua `require()` to load its modules at runtime, so you need to install both the autoconf file and the module files.

**Quick install:** download `ArchHUD.zip` from the [latest release](https://github.com/csdhome/archHUD-CG/releases/latest) and extract it into your `autoconf/custom` folder, keeping its folder structure. This covers Steps 2 and 3. Then do Step 1 (atlas) and Step 4.

### Step 1: Copy the Atlas

Copy the Consortium atlas file to your DU autoconf directory:

```
atlas.lua  -->  <DU Install>/Game/data/lua/autoconf/custom/atlas.lua
```

Get the atlas from the [atlas-CG repo](https://github.com/csdhome/atlas-CG) ([direct download](https://raw.githubusercontent.com/csdhome/atlas-CG/main/atlas.lua)).

Open the file in a text editor after downloading. It must start with Lua code. If it starts with `<!DOCTYPE html>`, you saved a web page instead of the file. Download it again.

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
3. Choose **ArchHud - Consortium v2.106-CG**

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

The typical MyDU install path is:
```
C:\ProgramData\My Dual Universe\Game\data\lua\autoconf\custom\
```

### Updating

After copying new files, sit in the seat and re-select the autoconf (Step 4). The seat keeps its own copy of `ArchHUD.conf`. The module files in `archhud/` load fresh every time you sit down.

### Troubleshooting

If the vanilla flight HUD stays up when ArchHUD is applied, open the **Lua** tab in chat. ArchHUD prints the reason there, for example:

- `ArchHUD: could not load autoconf/custom/atlas.lua ...` means the atlas is missing or is not a Lua file. Redo Step 1.
- `ArchHUD: could not load autoconf/custom/archhud/<name>.lua ...` means a module is missing or damaged. Redo Step 2.
- `ERROR STARTUP: ...` means startup failed. Report the full message.

### Consortium-Specific Features

- All Consortium planets and moons in the atlas (including Prime planets, CG meganodes, Consortium Home World)
- Fuel tank support for XS through XXL sizes, tiers T1-T5, Standard/Optimised/Gravity-Inverted
- Speed limits set to 50,000 km/h (server max)
- Safe zone radius: 64,000,000 meters
- Space engine minimum altitudes for all Consortium atmospheric bodies
