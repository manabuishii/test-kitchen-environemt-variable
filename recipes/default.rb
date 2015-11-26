# get variables
sourcecode = node[:test_kitchen_environment_variable][:sourcecode]
options    = node[:test_kitchen_environment_variable][:options]
# output
log "sourcecode is ["+sourcecode+"]"
log "options    is ["+options+"]"
