{exec} = require 'child_process'

option '-t', '--test [SCRIPT]', 'specify the script to test (under examples dir)'

task 'build', 'Build korubaku', (options) ->
	exec 'coffee -o lib -c src', (err, stdout, stderr) =>
		throw err if err

task 'test', 'Test the specified example', (options) ->
	exec 'coffee -c examples', (err, stdout, stderr) =>
		throw err if err
		exec "node examples/#{options.test}.js", (err, stdout) =>
			console.log err if err
			console.log stdout if stdout
