using Oxide.Core.Libraries.Covalence;
using System;
using UnityEngine;
using System.Collections.Generic;
using Newtonsoft.Json;
using static ConsoleSystem;

namespace Oxide.Plugins
{
    [Info("Entity Cleaner", "erik1556", "1.0.0")]
    [Description("Clears all objects from the server except for specified LootContainers.")]

    class EntityCleaner : RustPlugin
    {
        private const string permUse = "entitycleaner.use";
        private static PluginConfig config;

        #region PluginConfig
        private class PluginConfig
        {
            [JsonProperty(PropertyName = "Excluded Loot Container Prefabs: ")]
            public List<string> excludedLootContainers { get; set; }

            public static PluginConfig DefaultConfig() => new PluginConfig()
            {
                excludedLootContainers = new List<string>
                {

                }
            };
        }

        protected override void LoadDefaultConfig()
        {
            PrintWarning("New configuration file created.");
            config = PluginConfig.DefaultConfig();
        }

        protected override void LoadConfig()
        {
            base.LoadConfig();
            config = Config.ReadObject<PluginConfig>();
            SaveConfig();
        }

        protected override void SaveConfig()
        {
            Config.WriteObject(config);
        }

        private bool IsExcludedLootContainer(BaseEntity entity)
        {
            if (entity == null) return false;

            var prefabPath = entity.PrefabName;
            return config.excludedLootContainers.Contains(prefabPath);
        }
        #endregion

        [ChatCommand("killall")]
        private void KillAllEntitiesCMD(BasePlayer player, string command, string[] args)
        {
            if (!permission.UserHasPermission(player.UserIDString, permUse))
            {
                player.ChatMessage("<color=#ffc34d>Entity Cleaner</color>: You don't have permission to use that.");
                return;
            }

            int entitiesRemoved = 0;
            float radius = -1; // -1 means radius is not specified

            if (args.Length > 0 && float.TryParse(args[0], out radius))
            {
                // Remove entities within the specified radius
                RaycastHit[] hits = UnityEngine.Physics.SphereCastAll(player.transform.position, radius, Vector3.up);
                foreach (RaycastHit hit in hits)
                {
                    var entity = hit.GetEntity();
                    if (entity is ResourceEntity || entity is CollectibleEntity || entity is JunkPile)
                    {
                        entity.Kill();
                        entitiesRemoved++;
                    }
                    else if (entity is LootContainer lootContainer && !IsExcludedLootContainer(lootContainer))
                    {
                        lootContainer.Kill();
                        entitiesRemoved++;
                    }
                }

                player.ChatMessage($"Removed {entitiesRemoved} entities within a {radius} meter radius.");
            }
            else
            {
                // Remove all entities on the map
                foreach (var entity in UnityEngine.Object.FindObjectsOfType<ResourceEntity>())
                {
                    entity.Kill();
                    entitiesRemoved++;
                }

                foreach (var entity in UnityEngine.Object.FindObjectsOfType<CollectibleEntity>())
                {
                    entity.Kill();
                    entitiesRemoved++;
                }

                foreach (var entity in UnityEngine.Object.FindObjectsOfType<JunkPile>())
                {
                    entity.Kill();
                    entitiesRemoved++;
                }

                foreach (var entity in UnityEngine.Object.FindObjectsOfType<LootContainer>())
                {
                    if (!IsExcludedLootContainer(entity))
                    {
                        entity.Kill();
                        entitiesRemoved++;
                    }
                }

                player.ChatMessage($"Removed {entitiesRemoved} entities across the entire map.");
            }
        }

        private void Init()
        {
            permission.RegisterPermission(permUse, this);
        }

        private void Unload()
        {
            config = null;
        }
    }
}
