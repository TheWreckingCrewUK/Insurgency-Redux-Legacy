/* by TWC Hobbs
starts when a platoon commander becomes active, then picks out some caches, strongholds and other objectives and selects 3, then presents them to the platoon commander. Once they are complete it compeltes the whole mission
*/

"Deployment Mode" hintc [
	"Deployment Mode has been activated",
	"A number of tasks are being assigned to you. Use the sections to get these tasks done, the mission will end once these are all complete."
];

remoteexec ["twc_fnc_campaignserver", 2];