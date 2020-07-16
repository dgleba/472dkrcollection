
# write engine properties file

# use envsubst to process env vars..
#cat ./conf/corp-000.template.properties | envsubst > "./syms/engines/${CORP_ENGINE_NAME}.properties"
# got envsubst not found.



# use eval to to process env vars..


eval "cat <<EOF >"./syms/engines/corp-000.properties"
$( cat ./conf/corp-000.template.properties )
EOF
" 2> /dev/null


# I dislike this template method, but I can't figure how to use env vars directly in the engine properties file.
