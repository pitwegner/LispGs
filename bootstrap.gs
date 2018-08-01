run
| methNodes gsMethod methDict env |
  methNodes := Array new.
  #(#'+' #'-' #'*' #'/' #'&' #'|' #'>' #'<' #'<=' #'>=' #'=')
    do: [ :symbol | 
      | blockNode argLeaf1 argLeaf2 |
      blockNode := GsComBlockNode new lexLevel: 1.
      argLeaf1 := GsComVarLeaf new
        blockArg: #'x'
        argNumber: 1
        forBlock: blockNode.
      argLeaf2 := GsComVarLeaf new
        blockArg: #'y'
        argNumber: 2
        forBlock: blockNode.
      blockNode appendArg: argLeaf1.
      blockNode appendArg: argLeaf2.
      blockNode
        appendStatement:
          (GsComSendNode new
            stSelector: symbol;
            rcvr: (GsComSendNode new
		stSelector: #'value';
		rcvr: (GsComVariableNode new leaf: argLeaf1));
            appendArgument: (GsComSendNode new
		stSelector: #'value';
		rcvr: (GsComVariableNode new leaf: argLeaf2))).
      methNodes
        add:
          (GsComMethNode newSmalltalk
            selector: symbol;
            source: symbol , '
    ^ [:x :y | x @env0: ' , symbol , ' y]';
            class: Object;
            appendStatement: (GsComReturnNode new returnFromHome: blockNode)) ].

  env := 3.
  methDict := Object persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methNodes do: [: node |
    gsMethod := GsNMethod generateFromIR: node.
    Object removeSelector: gsMethod selector environmentId: env ifAbsent: [  ].
    methDict at: gsMethod selector put: gsMethod].
  Object nonProtectedPersistentMethodDictForEnv: env put: methDict.
  Object _codeChangedForEnv: env.

Object
    compileMethod: 'sendmessage
	^ [:args | args @env0:
        perform: args @env0: first @env0: value
        env: args @env0: second @env0: second @env0: first @env0: value
        withArguments: args @env0: second @env0: first @env0: value]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'atom
	^ [:x | x @env0: isArray @env0: not @env0: & x @env0: isNil @env0: not ]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'cond
	^ [:pairs | pairs @env0: first @env0: first @env0: value @env0: 
		ifTrue: [pairs @env0: first @env0: second @env0: value]
		ifFalse: [self cond @env0: valueWithArguments: {pairs @env0: allButFirst}]].'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'list
	^ [:args | args].'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'car
	^ [:x | x @env0: first]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'cdr
	^ [:x | x @env0: second]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'cons
	^ [:x :y | {x. y}]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'apply
	^ [:f :args | f @env0: valueWithArguments: args]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'quote
	^ [:x | x @env0: isArray @env0: not @env0: & x @env0: isNil @env0: not @env0:
        ifTrue: [ x ]
        ifFalse: [ x @env0:
            ifNil: [ nil ]
            ifNotNil: [ {self quote @env0: valueWithArguments: {x @env0: first}. self quote @env0: valueWithArguments: {x @env0: second}} ]]]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

Object
    compileMethod: 'null
	^ [:x | x @env0: isNil]'
    category: 'primitives'
    using: GsSession currentSession symbolList
    environmentId: 3.

LispParser new newLispMeth: '(define and &)'.
LispParser new newLispMeth: '(define or |)'.
LispParser new newLispMeth: '(define eq =)'.
"LispParser new newLispMeth: '(define eval (lambda (exp) 
	(cond
		((null exp) nil)
		((atom exp) exp)
		(true (apply (car exp) (cdr exp))))))'."
%
