as yet unclassified
handleCond: exp in: env
  | arrayBuilderNode |
  arrayBuilderNode := GsComArrayBuilderNode new.
  self
    with: exp second
    do: [ :condition | 
      arrayBuilderNode
        appendElement:
          (GsComArrayBuilderNode new
            appendElement:
                (GsComBlockNode new
                    lexLevel: self lexLevel;
                    appendStatement: (self parse: condition first env: env);
                    yourself);
            appendElement:
                (GsComBlockNode new
                    lexLevel: self lexLevel;
                    appendStatement:
                        (self parse: condition second first env: env);
                    yourself);
            yourself) ].
  ^ GsComSendNode new
    stSelector: #'valueWithArguments:';
    rcvr:
        (GsComSendNode new
            lispSelector: exp first;
            rcvr: GsComVariableNode newSelf);
    appendArgument: (GsComArrayBuilderNode new appendElement: arrayBuilderNode)