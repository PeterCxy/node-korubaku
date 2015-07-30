{korubaku} = require "../index"
{exec} = require "child_process"

korubaku (ko) ->
	[err, stdout] = yield exec "echo 'test!!!'", ko.raw()
	throw err if err
	console.log stdout
