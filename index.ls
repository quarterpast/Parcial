Symbol = require \es6-symbol

partial = (id)->
	sym = Symbol id
	fns = {}

	(sym): (x, ...args)->
		if fns[x]?
			that.apply this, ...args
		else ...
	(id):~ -> @[sym]
	(id):~ (fn)->
		fns import fn
