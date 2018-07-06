as yet unclassified
doIt: source
  ^ nil performMethod: (GsNMethod generateFromIR: (self parse: source))