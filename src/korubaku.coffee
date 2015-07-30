class Korubaku
	constructor: (@function) ->
		
	run: =>
		@generator = @function this
		@generator.next null

makeCallbackStub = (callback) ->
	->
		=>
			if !@generator?
				throw new Error "The function has not been started yet."

			result = callback arguments

			@generator.next result

exports.korubaku = (func) ->
	(new Korubaku func).run()

# Register a type of callback under "name".
# "func" will be called when the callback is called.
# The result of the callback (what 'yield' returns) should be returned by the "func"
exports.registerCallback = registerCallback = (name, func) ->
	Korubaku.prototype[name] = makeCallbackStub func

# The default callback model
registerCallback 'default', (args) ->
	if args[0]
		throw args[0]
	else
		args[1]

# Or, return the argument list directly
registerCallback 'raw', (args) ->
	args
