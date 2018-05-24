as yet unclassified
symbolValue: aSymbol for: aClass ifNone: aBlock
  "look-up for the value bound to aSymbol. if none found, evaluate
	aBlock"

  | b frame |
  b := LispEvaluator code
    at: (aClass asString , '>>' , aSymbol) asSymbol
    ifAbsent: [ 
      aClass == Object
        ifTrue: [ self symbolBinding: aSymbol ]
        ifFalse: [ self symbolValue: aSymbol for: aClass superclass ifNone: aBlock ] ].
  b ifNotNil: [ ^ b value ].
  aSymbol == #'self'
    ifTrue: [ ^ self selfValue ].
  ^ (self parent ifNil: [ ^ aBlock value ]) symbolValue: aSymbol ifNone: aBlock