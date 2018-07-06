as yet unclassified
handleSymbolFunction: exp in: env
  | argNode |
  argNode := self createArgListFrom: exp in: env.
  ^ exp first isSymbol
    ifTrue: [ 
      env
        at: exp first
        ifPresent: [ :var | 
          GsComSendNode new
            stSelector: #'valueWithArguments:';
            rcvr: (GsComVariableNode new leaf: var);
            appendArgument: argNode ]
        ifAbsent: [ 
          GsComSendNode new
            stSelector: #'valueWithArguments:';
            rcvr:
                (GsComSendNode new
                    lispSelector: exp first;
                    rcvr: GsComVariableNode newSelf);
            appendArgument: argNode ] ]
    ifFalse: [ GsComLiteralNode new leaf: (self createLiteralLeaf: exp first) ]