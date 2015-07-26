{registerCallback, korubaku} = require '../index'

registerCallback 'dummy', (args) ->
	'Just a Test'

korubaku (ko) ->
	for i in [1..10]
		temp = yield setTimeout ko.dummy(), 1000
		console.log "[#{i}] #{temp}"


