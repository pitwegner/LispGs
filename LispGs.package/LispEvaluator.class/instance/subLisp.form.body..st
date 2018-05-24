private
subLisp: aSymbol form: aForm body: aConsCell
  ^ self
    subLisp: aSymbol
    form: aForm
    body: aConsCell
    environment: self environment newChild