Symbol = require \es6-symbol

module.exports = function partial id, options = {+strict}
	sym = Symbol id
	fns = {}

	(sym): (x, ...args)->
		if fns[x]?
			that.apply this, args
		else if options.strict
			...
	(id):~ -> @[sym]
	(id):~ (fn)->
		fns import fn
