as yet unclassified
selfValue
  | frame |
  frame := TDThisContext createContext.
  [ 
  (frame := frame parent) ~~ nil
    and: [ 
      ((frame receiver asString includesSubstring: 'LispEvaluator')
        and: [ frame selector == #'evaluate:' ]) not ] ]
    whileTrue.
  frame ifNotNil: [ ^ frame parent parent receiver ].
  ^ nil