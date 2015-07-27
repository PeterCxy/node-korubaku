Introduction
---
Korubaku (Katakana spelling for 'callback', コルバク) is a toy node.js module.

Korubaku intends to save you from the Callback Hell, using ES6's `yield` and `generator`.

A simple example
---
```coffeescript
{korubaku, registerCallback} = require 'korubaku'

registerCallback 'dummy', ->
	'Just a test'

korubaku (ko) ->
	result = yield setTimeout ko.dummy(), 1000
	console.log result
```

execute the code above, it will wait for a second, and output 'Just a test'.

A function that `yield`s is called a `generator function`. When a function `yield`s, it suspends itself, and waits for calling `next`. If a value is passed when calling `next`, it will be the return value of `yield` when the generator function is resumed.

A generator function passed to `korubaku` function will be executed and a callback object `ko` will be passed as the first argument. The object has methods that generates node-style callback functions.
On calling the generated callback, it should resume the generator function, pass back the final result to where it was `yield`ed.

By default, `ko` has a method `default`, which generates the callback for most cases. It accepts two arguments, and the first one should be an `Error`. If the `Error` is not null, throw it. If null, resume the generator function and pass the second argument as a result.
Callbacks can be extended with `registerCallback name, function`. The callback function should accept all callback parameters and return the final result or throw the error. Once registered, a new method named the same as the callback's name will be created in the object called `ko` above.

