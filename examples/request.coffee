request = require "request"
{korubaku} = require "../index"

korubaku (ko) ->
	res = yield request.get 'https://google.com', ko.default()
	console.log "response #{res.statusCode}"
