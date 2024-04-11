<#include "../transformer.ftl">
<#assign hasCustomTrims = false>
<#assign customTrims = []>
<#list armortrims as trim>
    <#if trim.type == "Custom">
        <#assign hasCustomTrims = true>
        <#assign customTrims += [trim]>
    </#if>
</#list>
{
  "sources": [
    {
      "type": "paletted_permutations",
      "textures": [
		<#list armortrims as trim>
		    "${modid}:trims/models/armor/${trim.getModElement().getRegistryName()}",
		    "${modid}:trims/models/armor/${trim.getModElement().getRegistryName()}_leggings"<#sep>,
		</#list>
      ],
      "palette_key": "trims/color_palettes/trim_palette",
      "permutations": {
        "quartz": "trims/color_palettes/quartz",
        "iron": "trims/color_palettes/iron",
        "gold": "trims/color_palettes/gold",
        "diamond": "trims/color_palettes/diamond",
        "netherite": "trims/color_palettes/netherite",
        "redstone": "trims/color_palettes/redstone",
        "copper": "trims/color_palettes/copper",
        "emerald": "trims/color_palettes/emerald",
        "lapis": "trims/color_palettes/lapis",
        "amethyst": "trims/color_palettes/amethyst",
		"iron_darker": "trims/color_palettes/iron_darker",
        "gold_darker": "trims/color_palettes/gold_darker",
        "diamond_darker": "trims/color_palettes/diamond_darker",
        "netherite_darker": "trims/color_palettes/netherite_darker"<#if hasCustomTrims>,
        <#list customTrims as trim>
            <#list trim.materials as mat>
                ${mappedMCItemToName(mat)}: "trims/color_palettes/${trim.getModElement().getRegistryName()}"<#if trim?has_next || mat?has_next>,</#if>
            </#list>
        </#list>
        </#if>
      }
    }
  ]
}