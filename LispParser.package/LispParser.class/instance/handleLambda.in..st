as yet unclassified
handleLambda: exp in: env
  | blockNode i newEnv |
  newEnv := env copy.
  self lexLevel: self lexLevel + 1.
  blockNode := GsComBlockNode new lexLevel: self lexLevel.
  i := 1.
  self
    with: exp second first
    do: [ :arg | 
      | leaf |
      leaf := GsComVarLeaf new blockArg: arg argNumber: i forBlock: blockNode.
      newEnv at: arg put: leaf.
      blockNode appendArg: leaf.
      i := i + 1 ].
  self
    with: exp second second
    do: [ :statement | 
      | leaf |
      statement first == #'define'
        ifTrue: [ 
          leaf := GsComVarLeaf new
            blockTemp: statement second first
            sourceLexLevel: self lexLevel.
          newEnv at: statement second first put: leaf.
          blockNode appendTemp: leaf ] ].
  self
    with: exp second second
    do: [ :statement | blockNode appendStatement: (self parse: statement env: newEnv) ].
  self lexLevel: self lexLevel - 1.
  ^ blockNode