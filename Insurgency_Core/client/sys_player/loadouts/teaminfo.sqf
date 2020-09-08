params [["_type", "sf"]];

_text1 = "Rangers: US Army. Weapons: Block II M4, holographic sights with magnifiers. Medium.<br /><br />SEALS: US Navy. Weapons: HK416, MP7, holographic sights with magnifiers. Medium<br /><br />ACE: US Army, formerly known as Delta. Weapons: Block II M4, variable optics. Easy.<br /><br />ANA: Afghan Commando Corps. Weapons: M4A1, ACOG optics. Medium.<br /><br /> SAS: British Army. Weapons: M4 variant, ACOG optics. Easy.<br /><br />2REI: French Foreign Legion. Weapons: FAMAS, holographic and open sights. Hard. <br /><br />Choose wisely, you can only switch teams once every 10 minutes.";

if (_type == "sniper") then {
	_text1 = "BAF (Default): Weapons: L115A3, L129, L85.<br />Extreme Range.<br /><br />Rangers: Weapons: M2010, SR25.<br />Medium Range<br /><br />US Army: Weapons: M24, M4, SR25.<br />Medium Range.<br /><br />USMC FORECON: Weapons: M107, SR25.<br />Medium Range.<br /><br />SAS: Weapons: L115A3, HK417.<br />Extreme Range<br /><br />Choose wisely, you can only switch teams once every 10 minutes.";
};


_text = parsetext _text1;

hint _text;