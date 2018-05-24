*LispGs
lispSource
  | stream |
  stream := ReadWriteStream on: String new.
  (LispEvaluator code
    at: (self inClass asString , '>>' , self selector allButLast) asSymbol)
    printOn: stream.
  ^ stream contents