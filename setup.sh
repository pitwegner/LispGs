startTopaz $1 -l << EOF
set u SystemUser p swordfish
login
run
SystemObjectSecurityPolicy worldAuthorization: #write.
(AllUsers userWithId: 'DataCurator') addPrivilege: #'CompilePrimitives'.
%
commit
logout
exit
EOF
todeIt $1 mc load LispGs filetree://$GS_HOME/shared/repos/LispGs
