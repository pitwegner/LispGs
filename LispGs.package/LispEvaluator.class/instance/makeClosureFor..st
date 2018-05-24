private
makeClosureFor: aConsCell
  | clo |
  clo := LispClosure new.
  clo form: aConsCell.
  clo environment: self environment.
  ^ clo