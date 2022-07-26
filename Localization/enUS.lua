local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local L = LibStub("AceLocale-3.0"):NewLocale("EasyFrames", "enUS", true, debug)

L["loaded. Options:"] = true

L["Opacity"] = true
L["Opacity of combat texture"] = true

L["Main options"] = true
L["In main options you can set the global options like colored frames, class portraits, etc"] = true

L["Percent"] = true
L["Current + Max"] = true
L["Current + Max + Percent"] = true
L["Current + Percent"] = true
L["Custom format"] = true

L["HP and MP bars"] = true

L["Font size"] = true
L["Healthbar and manabar font size"] = true
L["Font family"] = true
L["Healthbar and manabar font family"] = true

L["Reverse the direction of losing health/mana"] = true
L["By default direction starting from right to left. If checked direction of losing health/mana will be from left to right"] = true

L["Custom format of HP"] = true
L["You can set custom HP format. More information about custom HP format you can read on project site.\n\n" ..
    "Formulas:"] = true
L["Use full values of health"] = true
L["Formula converts the original value to the specified value.\n\n" ..
    "Description: for example formula is '%.fM'.\n" ..
    "The first part '%.f' is the formula itself, the second part 'M' is the abbreviation\n\n" ..
    "Example, value is 150550. '%.f' will be converted to '151' and '%.1f' to '150.6'"] = true
L["Value greater than 1000"] = true
L["Value greater than 100 000"] = true
L["Value greater than 1 000 000"] = true
L["Value greater than 10 000 000"] = true
L["Value greater than 100 000 000"] = true
L["Value greater than 1 000 000 000"] = true
L["By default all formulas use divider (for value eq 1000 and more it's 1000, for 1 000 000 and more it's 1 000 000, etc).\n\n" ..
    "If checked formulas will use full values of HP (without divider)"] = true
L["Displayed HP by pattern"] = true
L["You can use patterns:\n\n" ..
    "%CURRENT% - return current health\n" ..
    "%MAX% - return maximum of health\n" ..
    "%PERCENT% - return percent of current/max health\n\n" ..
    "All values are returned from formulas. For set abbreviation use formulas' fields"] = true

L["Frames"] = true
L["Setting for unit frames"] = true

L["Class colored healthbars"] = true
L["If checked frames becomes class colored.\n\n" ..
    "This option excludes the option 'Healthbar color is based on the current health value'"] = true
L["Healthbar color is based on the current health value"] = true
L["Healthbar color is based on the current health value.\n\n"..
    "This option excludes the option 'Class colored healthbars'"] = true
L["Custom buffsize"] = true
L["Buffs settings (like custom buffsize, highlight dispelled buffs, etc)"] = true
L["Turn on custom buffsize"] = true
L["Turn on custom target and focus frames buffsize"] = true
L["Buffs"] = true
L["Buffsize"] = true
L["Self buffsize"] = true
L["Buffsize that you create"] = true
L["Highlight dispelled buffs"] = true
L["Highlight buffs that can be dispelled from target frame"] = true
L["Dispelled buff scale"] = true
L["Dispelled buff scale that can be dispelled from target frame"] = true
L["Only if player can dispel them"] = true
L["Highlight dispelled buffs only if player can dispel them"] = true

L["Class portraits"] = true
L["Replaces the unit-frame portrait with their class icon"] = true

L["Texture"] = true
L["Set the frames bar Texture"] = true
L["Bright frames border"] = true
L["You can set frames border bright/dark color. From bright to dark. 0 - dark, 100 - bright"] = true
L["Use a light texture"] = true
L["Use a brighter texture (like Blizzard's default texture)"] = true

L["Frames colors"] = true
L["In this section you can set the default colors for friendly, enemy and neutral frames"] = true
L["Set default friendly healthbar color"] = true
L["You can set the default friendly healthbar color for frames"] = true
L["Set default enemy healthbar color"] = true
L["You can set the default enemy healthbar color for frames"] = true
L["Set default neutral healthbar color"] = true
L["You can set the default neutral healthbar color for frames"] = true
L["Reset color to default"] = true

L["Other"] = true
L["In this section you can set the settings like 'show welcome message' etc"] = true
L["Show welcome message"] = true
L["Show welcome message when addon is loaded"] = true


L["Player"] = true
L["In player options you can set scale player frame, healthbar text format, etc"] = true
L["Show or hide some elements of frame"] = true
L["Show player name"] = true
L["Player frame scale"] = true
L["Scale of player unit frame"] = true
L["Enable hit indicators"] = true
L["Show or hide the damage/heal which you take on your unit frame"] = true
L["Player healthbar text format"] = true
L["Set the player healthbar text format"] = true
L["Show player specialbar"] = true
L["Show or hide the player specialbar, like Paladin's holy power, Priest's orbs, Monk's harmony or Warlock's soul shards"] = true
L["Show player resting icon"] = true
L["Show or hide player resting icon when player is resting (e.g. in the tavern or in the capital)"] = true
L["Show player status texture (inside the frame)"] = true
L["Show or hide player status texture (blinking glow inside the frame when player is resting or in combat)"] = true
L["Show player combat texture (outside the frame)"] = true
L["Show or hide player red background texture (blinking red glow outside the frame in combat)"] = true
L["Show player group number"] = true
L["Show or hide player group number when player is in a raid group (over portrait)"] = true
L["Show player role icon"] = true
L["Show or hide player role icon when player is in a group"] = true


L["Target"] = true
L["In target options you can set scale target frame, healthbar text format, etc"] = true
L["Target frame scale"] = true
L["Scale of target unit frame"] = true
L["Target healthbar text format"] = true
L["Set the target healthbar text format"] = true
L["Show target of target frame"] = true
L["Show target name"] = true
L["Show target combat texture (outside the frame)"] = true
L["Show or hide target red background texture (blinking red glow outside the frame in combat)"] = true
L["Show blizzard's target castbar"] = true
L["When you change this option you need to reload your UI (because it's Blizzard config variable). \n\nCommand /reload"] = true


L["Focus"] = true
L["In focus options you can set scale focus frame, healthbar text format, etc"] = true
L["Focus frame scale"] = true
L["Scale of focus unit frame"] = true
L["Focus healthbar text format"] = true
L["Set the focus healthbar text format"] = true
L["Show target of focus frame"] = true
L["Show name of focus frame"] = true
L["Show focus combat texture (outside the frame)"] = true
L["Show or hide focus red background texture (blinking red glow outside the frame in combat)"] = true


L["Pet"] = true
L["In pet options you can set scale pet frame, show/hide pet name, enable/disable pet hit indicators, etc"] = true
L["Pet frame scale"] = true
L["Scale of pet unit frame"] = true
L["Lock pet frame"] = true
L["Lock or unlock pet frame. When unlocked you can move frame using your mouse (draggable)"] = true
L["Reset position to default"] = true
L["Show pet name"] = true
L["Show or hide the damage/heal which your pet take on pet unit frame"] = true
L["Show pet combat texture (inside the frame)"] = true
L["Show or hide pet red background texture (blinking red glow inside the frame in combat)"] = true
L["Show pet combat texture (outside the frame)"] = true
L["Show or hide pet red background texture (blinking red glow outside the frame in combat)"] = true





