
find newest files


cd /

# all 20 days
  find  . -mtime -20 -type f -print0 | xargs -0 stat --printf='%.16y %A %a %h %U %u\t %G %g\t %s\t %n\n'  | sort -n |  grep -v '.git/' | grep -v tmp/ \
    | grep -v x/ |   grep -v /datasys/  |   grep -v proc/  | grep -v sys/    | tail -n19254>/code/findc 
  
# crudbuilder
  find  . -mtime -20 -type f -print0 | xargs -0 stat --printf='%.16y %A %a %h %U %u\t %G %g\t %s\t %n\n'  | sort -n |  grep -v '.git/' | grep -v tmp/ \
    | grep -v x/ |   grep -v /datasys/  |   grep -v proc/  | grep -v sys/  |grep  crudbuilder  | tail -n19254>/code/findb
  
  
# crud
  find  . -mtime -20 -type f -print0 | xargs -0 stat --printf='%.16y %A %a %h %U %u\t %G %g\t %s\t %n\n'  | sort -n |  grep -v '.git/' | grep -v tmp/ \
    | grep -v x/ |   grep -v /datasys/  |   grep -v proc/  | grep -v sys/  |grep  crud  | tail -n19254
  
# 2 days
  find  . -mtime -2 -type f -print0 | xargs -0 stat --printf='%.16y %A %a %h %U %u\t %G %g\t %s\t %n\n'  | sort -n |  grep -v '.git/' | grep -v tmp/ \
    | grep -v x/ |   grep -v /datasys/  |   grep -v proc/  | grep -v sys/    | tail -n19254 
  




