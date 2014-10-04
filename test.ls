require! {
	partial: './'
	\sinon-expect
	sinon
}

expect = sinon-expect.enhance (require \expect.js), sinon, \was

export Parcial:
	'should create a function with the name': ->
		a = partial \a
		expect a.a .to.be.a Function
	'should throw when nothing assigned yet': ->
		a = partial \a
		expect (-> a.a '') .to.throw-error /unimplemented/
	'should call tagged method after assign': ->
		a = partial \a
		a.a = spy: spy = sinon.spy!
		a.a \spy
		expect spy .was.called!
	'should call tagged method with args': ->
		a = partial \a
		a.a = spy: spy = sinon.spy!
		a.a \spy 1 2 3
		expect spy .was.called-with 1 2 3
	'should pass along return': ->
		a = partial \a
		a.a = spy: sinon.stub!.returns \a
		expect a.a \spy .to.be \a
	'should know about multiple tags': ->
		a = partial \a
		a.a = a: spy-a = sinon.spy!
		a.a = b: spy-b = sinon.spy!
		a.a \a
		a.a \b
		expect spy-a .was.called!
		expect spy-b .was.called!
	'should throw when given a tag it doesn\'t know': ->
		a = partial \a
		a.a = a: ->
		expect (-> a.a \b) .to.throw-error /unimplemented/
	'should not throw if options.strict is false':->
		a = partial \a {-strict}
		expect (-> a.a '') .not.to.throw-error!
