<h1>Insurgency <a href="https://travis-ci.org/TheWreckingCrewUK/Insurgency"><img src="https://travis-ci.org/TheWreckingCrewUK/Insurgency.svg?branch=master" alt="Insurgency Build Status"></a></h1>
Insurgency Public Mission - Framework & Maps

## Preparing the Environment
All core scripts, that is non-map specific, are done within \Insurgency_Core\. This aims to keep a consistent, and up to date experience between all maps. In order to save on effort, this directory utilises NTFS directory junctions & .gitignore to make for an easy work flow.

In order to edit an existing map, you need to clone the repo and run `prep_environment.cmd` with admin privs. This will make a link to the `\Insurgency_Core\` folder within the maps.

### Adding a New Map
In order to add a map, you need to edit `prep_environment.cmd`. Open the file with notepad and add a new line `mklink /j ".\#NEW MAP FOLDER#\Insurgency_Core" ".\Insurgency_Core\"` replacing `#NEW MAP FOLDER#` with the name of the new map folder, be sure to include the '.Map' name. 

For example, if I want to add a new Insurgency map on Malden. I add the following: `mklink /j ".\Insurgency_Malden.Malden\Insurgency_Core" ".\Insurgency_Core\"`. 

## Building
You'll need makePbo from Mikero installed in order to build. Once installed, run `prep_missions.cmd` and copy over PBOs to the server. Done.