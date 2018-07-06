as yet unclassified
handleAtom: atom in: env
  ^ atom isSymbol
    ifTrue: [ 
      env
        at: atom
        ifPresent: [ :leaf | GsComVariableNode new leaf: leaf ]
        ifAbsent: [ 
          GsComSendNode new
            lispSelector: atom;
            rcvr: GsComVariableNode newSelf ] ]
    ifFalse: [ GsComLiteralNode new leaf: (self createLiteralLeaf: atom) ]