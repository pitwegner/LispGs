*LispGs
linkAtCaps
  | stream |
  stream := WriteStream on: (self species new: self size * 2).
  self
    do: [ :c | 
      c isUppercase
        ifTrue: [ 
          stream
            nextPut: $-;
            nextPut: c asLowercase ]
        ifFalse: [ stream nextPut: c ] ].
  ^ stream contents