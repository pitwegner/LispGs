accessing
code
  ^ StoredCode ifNil: [ StoredCode := IdentityDictionary new ]