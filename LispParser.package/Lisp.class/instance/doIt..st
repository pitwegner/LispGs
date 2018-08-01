as yet unclassified
doIt: source
  | gsMethod methDict env |
  env := 3.
  gsMethod := GsNMethod generateFromIR: (LispParser new parse: source).
  gsMethod selector == #'doIt'
    ifTrue: [ ^ nil performMethod: gsMethod ].
  Object removeSelector: gsMethod selector environmentId: env ifAbsent: [  ].
  methDict := Object persistentMethodDictForEnv: env.
  methDict ifNil: [ methDict := GsMethodDictionary new ].
  methDict at: gsMethod selector put: gsMethod.
  Object nonProtectedPersistentMethodDictForEnv: env put: methDict.
  Object _codeChangedForEnv: env.
  ^ gsMethod selector