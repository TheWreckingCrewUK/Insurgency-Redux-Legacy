<h1>Insurgency <a href="https://travis-ci.org/TheWreckingCrewUK/Insurgency"><img src="https://travis-ci.org/TheWreckingCrewUK/Insurgency.svg?branch=master" alt="Insurgency Build Status"></a></h1>
Insurgency Public Mission - Framework & Maps

## Preparing the Environment
All core scripts, that is non-map specific, are done within \Insurgency_Core\. This aims to keep a consistent, and up to date experience between all maps. In order to save on effort, this directory utilises NTFS directory junctions & .gitignore to make for an easy work flow.

In order to edit an existing map or a new map, you need to clone the repo and run `prep_environment.cmd` with admin privs. This will make a link to the `\Insurgency_Core\` folder within the map folders.

_Please note, if you wish to make a new non-map folder, please inform Bosenator first, so he can add it to the exceptions list._

## Building
You'll need makePbo from Mikero installed in order to build. Once installed, run `prep_missions.cmd` and copy over PBOs to the server. This will add the build date to the description.ext before building the PBO, in hopes of keeping the players better informed on the status.