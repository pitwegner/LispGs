startTopaz $1 -l << EOF
set u SystemUser p swordfish
login
run
SystemObjectSecurityPolicy worldAuthorization: #write.
(AllUsers userWithId: 'DataCurator') addPrivilege: #'CompilePrimitives'.
%
commit

run
GsCompilerClasses keysAndValuesDo: [:symbol : class |
  Globals at: symbol put: class
]
%

commit
logout
login

input $GS_HOME/server/stones/$1/product/upgrade/GsNMethodIr.gs
input bootstrap.gs

commit
logout
exit
EOF
