<p align="center">
# Parcial <br>![Build Status](https://travis-ci.org/quarterto/Parcial.svg)](https://travis-ci.org/quarterto/Parcial)
</p>

Tagged partial methods, like:

```javascript
var a = parcial('b');

try { a.b() }
catch(e) { ok(e.message == 'unimplemented') }

a.b = {tag: function() { return "you're it" }};
a.b('tag'); //⇒ "you're it"

a.b = {another: function(a) { return a * 2 }};
a.b('another', 5); //⇒ 10

a.b = {tag: function() { return "you got me" }};
a.b('tag'); //⇒ "you got me"
```

## why

Parcial works great with mixins. No need to do a deep merge; just use partials:

```javascript
var base = parcial('method');

var a = {method: {a: function() { return 'a' }}};
var b = {method: {b: function() { return 'b' }}};
var c = {method: {c: function() { return 'c' }}};

var agg = xtend({}, base, a, b, c);
agg.method('a'); //⇒ 'a'
agg.method('b'); //⇒ 'b'
agg.method('c'); //⇒ 'c'
```

## Licence
MIT. &copy; 2014 Matt Brennan
