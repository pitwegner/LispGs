as yet unclassified
createLiteralLeaf: aLiteral
  (aLiteral isKindOf: Integer)
    ifTrue: [ ^ GsComLitLeaf new integerLiteral: aLiteral ].
  (aLiteral isKindOf: Float)
    ifTrue: [ ^ GsComLitLeaf new floatLiteral: aLiteral ].
  (aLiteral isKindOf: Symbol)
    ifTrue: [ ^ GsComLitLeaf new symbolLiteral: aLiteral ].
  (aLiteral == nil or: [ aLiteral == true ] or: [ aLiteral == false ])
    ifTrue: [ ^ GsComLitLeaf new specialLiteral: aLiteral ]