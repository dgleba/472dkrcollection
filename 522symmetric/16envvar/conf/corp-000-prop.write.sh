
# write engine properties file

# bash template replace environment variables in file
# https://stackoverflow.com/questions/415677/how-to-replace-placeholders-in-a-text-file
# https://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash/2916159

# idea 1.
# error.. got envsubst not found.
# use envsubst to process env vars..
#cat ./conf/corp-000.template.properties | envsubst > "./syms/engines/${CORP_ENGINE_NAME}.properties"


# idea 2.
# use eval to to process env vars..

eval "cat <<EOF >"./syms/engines/corp-000.properties"
$( cat ./conf/corp-000.template.properties )
EOF
" 2> /dev/null


# I dislike this template method, but I can't figure how to use env vars directly in the engine properties file.
