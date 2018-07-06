as yet unclassified
rewriteArray: arr
  | cons |
  arr isArray
    ifFalse: [ ^ arr ].
  arr size = 0
    ifTrue: [ ^ nil ].
  arr
    reverseDo: [ :el | 
      cons := {(self rewriteArray: el).
      cons} ].
  ^ cons