Here's a template you can use for your GitHub project:

---

# Entity Cleaner Plugin

### Overview

**Entity Cleaner** is a plugin designed for Rust game servers that allows administrators to remove various entities from the game world. The plugin is particularly useful for maintaining server performance by cleaning up unused or unnecessary objects while allowing for the exclusion of specific Loot Containers from deletion.

### Permissions

- **`entitycleaner.use`**: Grants the user permission to execute the `/killall` command to remove entities from the server.

This permission is required to access the plugin's features. Server admins can assign this permission to trusted users who need control over entity cleanup.
### Features

- **Full Server Cleanup**: Remove all specified entities across the entire map with a single command.
- **Radius-Based Cleanup**: Specify a radius around the player to clean up entities in a specific area.
- **Customizable Exclusions**: Configure which Loot Containers should be excluded from removal.

### How It Works

1. **Permissions**: Ensure that players have the necessary permissions to use the `/killall` command.
2. **Command Usage**:
   - `/killall` - Removes all specified entities across the map.
   - `/killall <radius>` - Removes all specified entities within a given radius around the player.
3. **Configuration**: Edit the `config.json` file to add the prefabs of Loot Containers you want to exclude from cleanup.

### Example Config

```json
{
  "Excluded Loot Container Prefabs: ": [
    "assets/bundled/prefabs/radtown/crate_basic.prefab",
    "assets/bundled/prefabs/radtown/crate_elite.prefab"
  ]
}
```

### Supported Entity Types for Removal

- **Resources**: Trees, ores, etc.
- **Collectibles**: Mushrooms, hemp, etc.
- **Junk Piles**: Various junk pile types.
- **Loot Containers**: Except those specified in the configuration.

### Installation

1. Download the plugin and place it in the `oxide/plugins` directory on your Rust server.
2. Reload the plugin or restart the server to apply changes.
3. Configure the plugin as needed via the `config.json` file.

### Links

- **GitHub Repository**: [Entity-Cleaner](https://github.com/ErikGrischuk/Entity-Cleaner/releases/tag/vv1.0.0)
- **Rust Plugin Documentation**: [Link to Oxide documentation or related resources]
- **Support**: [Discord](https://discord.gg/gEXKrC2FRf)

---
