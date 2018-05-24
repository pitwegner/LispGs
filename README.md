# LispGs

# Installation

* requires working GemStone setup on Version >= 3.5.0
* run `./setup.sh <stoneName>`

# Usage

* evaluate Lisp Expression: `LispEvaluator eval: '<LispCode>'`
* define lisp method: `Integer compileLisp: '(define plus (lambda (x) (+ x self)))'`
* call lisp method from Smalltalk: `3 @env2: plus: 4`
* special form to call Smalltalk methods from Lisp: `(send-message RECEIVER SELECTOR ARGUMENTS...)`
* only known class is Globals, use `(send-message Globals (quote at:) (quote CLASSNAME))` to access other classes
