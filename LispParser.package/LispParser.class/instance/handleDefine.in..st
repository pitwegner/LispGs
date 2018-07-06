as yet unclassified
handleDefine: exp in: env
  ^ GsComAssignmentNode new
    dest: (env at: exp second first)
    source: (self parse: exp second second first env: env)