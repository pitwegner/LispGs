as yet unclassified
handleQuote: exp in: env
  ^ GsComSendNode new
    stSelector: #'valueWithArguments:';
    rcvr:
        (GsComSendNode new
            lispSelector: exp first;
            rcvr: GsComVariableNode newSelf);
    appendArgument:
        (GsComLiteralNode new
            leaf: (GsComLitLeaf new arrayLiteral: {(exp second first)}))