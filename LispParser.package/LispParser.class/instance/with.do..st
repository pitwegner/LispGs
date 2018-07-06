as yet unclassified
with: cons do: aBlock
  | cell |
  cell := cons.
  [ cell isArray ]
    whileTrue: [ 
      aBlock value: cell first.
      cell := cell second ]