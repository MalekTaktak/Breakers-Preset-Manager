# Breakers-Preset-Manager

Windows Batch file that lets you manage your presets in Dragon Ball The Breakers.

This batch script was made by MrPan (with shoutouts to Jupiter and Luck_Es for testing). It was originally intended for use by content creators to be able to load and save their CaCs, outfits, skillsets, kits and voiceline setups, smoothly switching between different setups at ease.

#What is a preset?

A preset is basically your CaC, with all their skills, clothes and kits, basically your current save file. 

#Features: 
* Save your active folder as a new preset, or update a previous preset with the same name
* Load a previously saved preset, with the option to save your active preset as you load a previous one
* Delete a preset, in case you made one by accident or for testing purposes

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/93730997-4c24-4651-9aa6-5edcc92baa09)

#What does this do?

This script makes it so you can switch between different save files effortlessly while keeping every single detail of your CaC setups and skillsets without the hassle of having to manually edit your CaC for every occasion.

#How does this work?

On a technical level, it only makes copies of your existing save files under different names as multiple "DRAGON BALL THE BREAKERS" save folders.
The regular folder for your preset is named "DRAGON BALL THE BREAKERS" in the Bandai Namco Entertainment folder under LocalAppData.
What this script does is make copies of the "DRAGON BALL THE BREAKERS" folder and rename them under the format "DRAGON BALL THE BREAKERS - ExamplePreset".
When you load a preset, you will be presented by whether or not you want to save your current preset so you will not lose any data you may have, 
copying your current "DRAGON BALL THE BREAKERS" to a folder for example called "DRAGON BALL THE BREAKERS - ExamplePreset1", 
then the preset of your choosing for example with name "DRAGON BALL THE BREAKERS - ExamplePreset2" will be renamed to "DRAGON BALL THE BREAKERS" effectively making it the active save folder.

#How to use:

Extract BreakersPresetManager.bat to any folder, and run it. No additional installation needed.

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/ade2ec5e-c0df-451d-a438-faaeb181a39c)

Save your first preset (your current save folder) using the [S]ave function to start using. Then boot up Breakers, make some changes to your CaC and skills, close Breakers when you're done making changes.

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/addb6fb3-299e-48de-b2c6-1c023a92bbee)

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/f2a13aeb-730e-4ace-91d1-c69f1927fbbb)

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/1907221d-d89e-431f-8f25-71a4730807cd)


When ready, save your second preset you just made under a different name then load your first preset, you can do so by selecting the "[L]oad" function then choosing the save current preset function. 

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/7010b3c9-bd2e-46df-bf72-95097fd3b277)


![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/a6f3a5bc-2308-4502-ad53-bbf2256cf2e1)

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/efd915d8-8673-412e-a3f5-60fd458e206f)

Your first CaC is back! With all their clothes and skillset! Now you can switch back and forth between multiple setups! Yay! (How'd they do that?)

![image](https://github.com/MalekTaktak/Breakers-Preset-Manager/assets/5912500/d111e7bd-8a40-4cc9-9065-668fc61624d3)

#FAQ
  
* Will I get banned for using this?
* 
  Short answer: No.
  
  Long answer: Absolutely no chance. This script basically only renames your existing older save folders localized within %LocalAppData% and copies it under different folders, it will also only run if Dragon Ball the Breakers is closed.
  It works the same as loading a previous save from Steam Cloud from another computer, which can have a different CaC and skillset without a problem.

* Will I lose the clothes I purchased with TP or skills I rolled from the gacha by using this?
* 
  Not a chance. Your skills/clothes, currencies (TP/zeni/tickets) and other items are tied to your Steam account and cannot be lost.
