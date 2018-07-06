as yet unclassified
createArgListFrom: exp in: env
  | arrayBuilderNode |
  arrayBuilderNode := GsComArrayBuilderNode new.
  self
    with: exp second
    do: [ :arg | arrayBuilderNode appendElement: (self parse: arg env: env) ].
  ^ arrayBuilderNode