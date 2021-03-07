resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

resource_type 'gametype' { name = 'Survival' }

server_scripts {

}

client_scripts {
	'@NativeUI/NativeUI.lua',
	'client/world.lua',
	'client/sselector.lua',
}

