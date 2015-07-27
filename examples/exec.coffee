{exec} = require 'child_process'
{korubaku} = require '../index'

korubaku (ko) ->
	stdout = yield exec 'echo "Tesuto sukuriputo"', ko.default()
	console.log stdout
