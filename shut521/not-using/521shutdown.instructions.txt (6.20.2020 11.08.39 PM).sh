#!/usr/bin/env bash
echo Read these instructions and paste.
exit


11.

open cmd prompt on pc that will have access to all vm''s

you may have to do 11b and 11c on that machine.


cd C:\n\sfile\knowtes\2018\bash353\shutdown521



11b.

install cygwin portable if needed on windows.

  - mkdir c:\app\cyg; cd c:\app\cyg  # everything will be inside this folder.
  - download https://github.com/vegardit/cygwin-portable-installer/blob/master/cygwin-portable-installer.cmd
  - from line 30 to 90  change yes to yesx to prevent installation of most items.
  - set CYGWIN_PACKAGES=bash-completion,openssh,openssl,rsync,ssh-pageant
  - this should install in two minute taking about 190mb when finished.



11c.

  
run this once.
  ssh-keygen



22.

# ONE-TIME

# install keys once.

# password.. you cant see that it is pasted.. but it is.


bash ./prep521.sh



33.

# ONE-TIME

# If this asks for password, then the ssh key is not installed. you should install missing keys.

bash ./test521.sh



44.

# shutdown the linux VM''s by ssh

bash ./shutlinux521.sh


55.

How to shutdown esxi windows vm''s from cmd?



