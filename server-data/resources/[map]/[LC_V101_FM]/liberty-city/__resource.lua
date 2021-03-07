resource_type 'map' { gameTypes = { fivem = true } }

client_script 'zone_names.lua'

map 'map.lua'

before_level_meta 'data.meta'

replace_level_meta 'liberty-city'

files {

    'liberty-city.meta',
    'images.meta',
	'water.xml',
	'popcycle.dat',
	'popzonelc.ipl',
	'popzone.ipl',
	'zonebind.meta',
	'data.meta',
	'popgroups.ymt',
	'Newtonsoft.Json.dll',
	'Newtonsoft.Json.xml',
	'pathzones.xml',
	'paths.rpf',
	'traintracks.xml',
	'trains13.dat',
	'trains14.dat',
	'trains15.dat',	
	'trains16.dat',
	'trains17.dat',
}


data_file 'TRAINTRACK_FILE' 'traintracks.xml'

data_file 'POPSCHED_FILE' 'popcycle.dat'
data_file 'ZONEBIND_FILE' 'zonebind.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'



