testing
applyInTailTo: aConsCell inLisp: aLisp asMacro: mflag
  ^ form
    applyTo: aConsCell
    inLisp: aLisp
    withEnvironment: self environment
    noSubLisp: true