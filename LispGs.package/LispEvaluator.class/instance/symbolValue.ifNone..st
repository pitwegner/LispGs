private
symbolValue: aSymbol ifNone: aBlock
  ^ self environment symbolValue: aSymbol ifNone: aBlock