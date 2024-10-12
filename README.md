# LXR-SmallResources

### Part of the **LXRCore** RedM Framework

Welcome to **LXR-SmallResources**, a collection of lightweight and essential resource scripts designed to complement the **LXRCore** RedM Framework. These scripts are optimized for performance and flexibility, ensuring they integrate seamlessly with your RedM server setup.

## Overview

LXR-SmallResources provides small but essential utilities that enhance the roleplay experience and offer useful features for server admins and players alike. These scripts are designed to work out of the box with the LXRCore framework, but can also be adapted for use with other frameworks.

### Key Features
- **Lightweight Scripts:** Each script is designed to be as resource-efficient as possible, ensuring smooth server performance.
- **Plug-and-Play:** Easily integrate any of the small resources into your server with minimal configuration.
- **Modular:** Use only the scripts you need; each resource is standalone and can be added or removed individually.
- **Compatibility:** Designed to work seamlessly with LXRCore, but adaptable to other RedM frameworks.
- **Regular Updates:** Continuously maintained to ensure compatibility with new RedM updates and improvements to the LXRCore framework.

## Included Resources

### 1. `LXR-WeatherSync`
This resource syncs weather conditions across all players, ensuring a consistent atmospheric experience for everyone.

### 2. `LXR-HudEnhancer`
A minimalist HUD script to enhance the user interface without cluttering the screen. Provides essential stats such as health, hunger, and thirst in a clean and compact design.

### 3. `LXR-AFKKick`
A simple anti-AFK script that kicks idle players after a configurable timeout, keeping the server active and preventing ghost players from taking up server slots.

### 4. `LXR-Notifications`
A customizable notification system that provides in-game alerts and messages in a stylish and non-intrusive manner.

### 5. `LXR-Compass`
Adds a customizable, on-screen compass to improve navigation without breaking immersion. Includes options for cardinal directions, custom markers, and more.

### 6. `LXR-Teleport`
A simple and efficient teleport system for admins and players with permission. Use preset teleport locations or set your own custom points.

## Installation

1. **Download** the desired resources from the repository or clone the repository to your local machine:
   ```
   git clone https://github.com/LXRCore/LXR-SmallResources.git
   ```

2. **Add the resources** to your RedM server's `resources` folder.

3. **Ensure** the resources are listed in your `server.cfg` file:
   ```plaintext
   ensure LXR-WeatherSync
   ensure LXR-HudEnhancer
   ensure LXR-AFKKick
   ensure LXR-Notifications
   ensure LXR-Compass
   ensure LXR-Teleport
   ```

4. **Configure** each resource as needed by editing the configuration files located in each resource folder.

5. **Restart** your server to apply the changes.

## Configuration

Each resource comes with a `config.lua` file that allows for easy customization. Check the documentation within each resource for specific configuration options.

## Requirements

- **RedM**: The LXR-SmallResources package is designed to work on RedM roleplay servers.
- **LXRCore (Optional)**: While not mandatory, these scripts are optimized for use with the LXRCore framework.

## Contribution

We welcome contributions to improve and expand the LXR-SmallResources collection. Feel free to submit pull requests or open issues with any suggestions or improvements.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

### Links

- **Official LXRCore GitHub:** [https://github.com/LXRCore](https://github.com/LXRCore)
- **LXRCore Website:** [http://lxrcore.likeaking.pro/](http://lxrcore.likeaking.pro/)
