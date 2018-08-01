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

commit
logout
exit
EOF

todeIt $1 mc load LispParser filetree://$(pwd)

startTopaz $1 -l << EOF
set u DataCurator p swordfish
login

input bootstrap.gs

commit
logout
exit
EOF
