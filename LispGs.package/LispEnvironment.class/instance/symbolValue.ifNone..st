as yet unclassified
symbolValue: aSymbol ifNone: aBlock
  "look-up for the value bound to aSymbol. if none found, evaluate
	aBlock"

  ^ self symbolValue: aSymbol for: self selfValue class ifNone: aBlock