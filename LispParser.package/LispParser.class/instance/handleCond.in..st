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
            appendElement: (self parse: condition first env: env);
            appendElement: (self parse: condition second first env: env)) ].
  ^ GsComSendNode new
    stSelector: #'valueWithArguments:';
    rcvr:
        (GsComSendNode new
            lispSelector: exp first;
            rcvr: GsComVariableNode newSelf);
    appendArgument: arrayBuilderNode