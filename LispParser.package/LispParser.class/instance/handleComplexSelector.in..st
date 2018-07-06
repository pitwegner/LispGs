as yet unclassified
handleComplexSelector: exp in: env
  ^ GsComSendNode new
    stSelector: #'valueWithArguments:';
    rcvr: (self parse: exp first env: env);
    appendArgument: (self createArgListFrom: exp in: env)