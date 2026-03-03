# 🐺 LXR-SmallResources

### Part of the **LXRCore** RedM Framework | 🐺 The Land of Wolves

> **Server:** The Land of Wolves 🐺 | Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
> **Developer:** iBoss21 / The Lux Empire
> **Website:** [https://www.wolves.land](https://www.wolves.land) | **Discord:** [https://discord.gg/CrKcWdfd3A](https://discord.gg/CrKcWdfd3A) | **Store:** [https://theluxempire.tebex.io](https://theluxempire.tebex.io)

---

Welcome to **LXR-SmallResources**, an essential resource pack designed to provide lightweight, high-performance utilities for RedM roleplay servers. This all-in-one resource includes various features that improve the roleplay experience and enhance both player and admin functionality.

## Framework Support

| Framework    | Status              |
|--------------|---------------------|
| LXR-Core     | ✅ Primary           |
| RSG-Core     | ✅ Primary           |
| VORP Core    | ✅ Supported/Legacy  |
| Standalone   | ✅ Fallback          |

## Overview

LXR-SmallResources is designed as a complete set of essential tools and features, packaged into a single, efficient resource. By integrating these features into one resource, server owners can reduce the number of separate scripts running on their server, leading to better performance and easier management.

### Key Features

- **Unified Resource:** All essential tools and features are bundled into one resource for ease of installation and management.
- **Lightweight:** Optimized for minimal impact on server performance, ensuring smooth gameplay for all players.
- **Modular Configuration:** Easily enable or disable individual features through the configuration file, tailoring the resource to your server's needs.
- **Multi-Framework:** Designed to work with LXRCore, RSG-Core, VORP Core, or standalone setups.
- **wolves.land Branding:** Production-grade style with full Tebex escrow compliance.

## Included Features

### 1. **AFK Management**
Automatically detects and manages inactive players, removing them from the server after a configurable timeout to free up server slots.

### 2. **Consumables System**
Handles eating, drinking, alcohol consumption, and smoking with full animations and HUD stat updates.

### 3. **Density Control**
Controls ambient ped, animal, and vehicle traffic density multipliers for performance and atmosphere tuning.

### 4. **Discord Rich Presence**
Sets up Discord Rich Presence with wolves.land branding, showing live player counts and custom buttons.

### 5. **Eagle Eye**
Enables the eagle-eye vision native for all players on spawn.

### 6. **Hands Up**
Press `X` to raise/lower your hands using an authentic robbery animation loop.

### 7. **Event Ignore / Game Event System**
Suppresses unwanted native game events and exposes useful ones as `LXRCore:Event:*` triggers. Also fixes the ability input lockout from the radial menu.

### 8. **Recoil System**
Applies per-weapon camera recoil on each shot for a more authentic shooting experience.

### 9. **Teleport System**
Creates interactive prompts for paired teleport locations defined in `Config.Teleports`.

### 10. **Discord Logging**
Sends structured Discord webhook embeds for server activity logging with wolves.land branding.

## Installation

1. **Download** the resource from the repository or clone it to your local machine:
   ```
   git clone https://github.com/LXRCore/lxr-smallresources.git
   ```

2. **Add the resource** to your RedM server's `resources` folder.
   > ⚠️ The folder **must** be named `lxr-smallresources` exactly — a runtime name guard will error if it is renamed.

3. **Ensure** the resource is listed in your `server.cfg` file:
   ```
   ensure lxr-smallresources
   ```

4. **Configure** the resource by editing `config.lua`. Key sections:
   - `Config.Framework` — set to `'auto'` or specify your framework manually
   - `Config.Discord` — set your Discord Application ID and asset names
   - `Config.Webhooks` — add your Discord webhook URLs for logging
   - `Config.Density` — tune ped/traffic/animal density multipliers
   - `Config.AFK` — configure the AFK kick timeout
   - `Config.Teleports` — add paired teleport locations

5. **Restart** your server to apply the changes.

## Requirements

- **RedM** server running the `cerulean` fx_version.
- **LXRCore** (or RSG-Core / VORP Core) for full functionality. Standalone mode is available as a fallback.

## Contribution

We welcome contributions to improve LXR-SmallResources. If you have any suggestions, improvements, or bug fixes, feel free to submit a pull request or open an issue.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

### Links

- **🐺 wolves.land:** [https://www.wolves.land](https://www.wolves.land)
- **Discord:** [https://discord.gg/CrKcWdfd3A](https://discord.gg/CrKcWdfd3A)
- **Store:** [https://theluxempire.tebex.io](https://theluxempire.tebex.io)
- **Official LXRCore GitHub:** [https://github.com/LXRCore](https://github.com/LXRCore)

---

*© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved*
