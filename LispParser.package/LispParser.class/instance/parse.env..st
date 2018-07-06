as yet unclassified
parse: arr env: env
  arr isArray
    ifFalse: [ ^ self handleAtom: arr in: env ].
  arr first isArray not & arr first isNil not
    ifTrue: [ 
      arr first == #'define'
        ifTrue: [ ^ self handleDefine: arr in: env ].
      arr first == #'lambda'
        ifTrue: [ ^ self handleLambda: arr in: env ].
      arr first == #'cond'
        ifTrue: [ ^ self handleCond: arr in: env ].
      arr first == #'quote'
        ifTrue: [ ^ self handleQuote: arr in: env ].
      ^ self handleSymbolFunction: arr in: env ].
  arr first isArray
    ifTrue: [ ^ self handleComplexSelector: arr in: env ].
  ^ self error: 'Illegal statement.'