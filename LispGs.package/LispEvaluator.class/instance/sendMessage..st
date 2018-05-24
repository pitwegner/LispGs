LISP-special forms
sendMessage: aConsCell
  "(send-message SELECTOR RECEIVER ARGUMENTS)
	Evaluate the Smalltalk expression
	RECEIVER perform: SELECTOR withArguments: ARGUMENTS"

  | rsym receiver selector arguments |
  rsym := aConsCell cdr car.
  rsym == #'Globals'
    ifTrue: [ receiver := Globals ]
    ifFalse: [ receiver := self evalObject: rsym ].
  selector := self evalObject: aConsCell car.
  arguments := Array new.
  aConsCell cdr cdr do: [ :arg | arguments add: (self evalObject: arg) ].
  ^ receiver perform: selector withArguments: arguments