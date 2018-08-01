as yet unclassified
parse: source
  | arr |
  [ arr := (RBParser parseExpression: '#' , source) value ]
    on: Error
    do: [ self error: 'Not a valid expression' ].
  arr isArray
    ifFalse: [ 
      ^ GsComMethNode newSmalltalk
        selector: #'doIt';
        source: source;
        class: Object;
        appendStatement:
            (GsComReturnNode new returnFromHome: (self handleAtom: arr in: Dictionary new)) ].
  arr := self rewriteArray: arr.
  arr first isArray not & arr first isNil not & (arr first == #'define')
    ifTrue: [ 
      ^ GsComMethNode newSmalltalk
        selector: arr second first;
        source: source;
        class: Object;
        appendStatement:
            (GsComReturnNode new
                returnFromHome:
                  (self parse: arr second second first env: Dictionary new)) ].
  ^ GsComMethNode newSmalltalk
    selector: #'doIt';
    source: source;
    class: Object;
    appendStatement:
        (GsComReturnNode new returnFromHome: (self parse: arr env: Dictionary new))