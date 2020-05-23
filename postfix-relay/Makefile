
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl


p:
	chmod +x *.sh


sh:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	# docker-compose  -f docker-compose.yml run --rm ubu /bin/bash
	docker-compose   exec mail /bin/bash
	

dd:
	# remove everything for this project. images and all.
	docker-compose down --remove-orphans --rmi all






 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 


#  other / examples stuff...


m8:
	docker-compose exec   mail /bin/bash -c ' sleep 1 && echo "Subject: test 617" | /usr/sbin/sendmail dgleba@gmail.com '
	
m7:
	# docker-compose exec   deb /bin/bash -c ' sleep 3 && echo "Subject: test 614" | /usr/sbin/sendmail dgleba@stackpole.com '
	docker-compose exec   mail /bin/bash -c 'echo -e "Test mail hotm 36  \n\nline3" | mail  -r david1212@gmail.com -s "Test sending mail"  dgleba@gmail.com'


m6:
	docker-compose exec  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 477"  dgleba@stackpole.com  '


# this wont work, but it works to send mail within make sh...  
m8a:
	docker-compose exec   deb /bin/bash -c ' sleep 3 && echo "Subject: test 614" | /usr/sbin/sendmail dgleba@stackpole.com '

m5:
	docker-compose run   deb /bin/bash -c ' sleep 3 && echo "Subject: test 612" | /usr/sbin/sendmail dgleba@stackpole.com '

m4:
	docker-compose run --rm  deb /bin/bash -c ' 	echo "Test mail debian-mail08 dkr" | mail  -r dgleba@stackpole.com -s "Test mail 470"  dgleba@stackpole.com  '

m3:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' 	echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 450"  dgleba@stackpole.com  '

m2:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Test mail debian-smpl dkr" | mail  -r dgleba@stackpole.com -s "Test mail 449"  dgleba@stackpole.com  '

sm:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run --rm  deb /bin/bash -c ' ls -la && pwd \
		&& debconf-show postfix && echo "Subject: test 447 debian-smpl dkr" | /usr/sbin/sendmail dgleba@stackpole.com  '

dco:
	# docker-compose  -f docker-compose.yml exec py /bin/bash
	docker-compose  -f docker-compose.yml run  deb /bin/bash -c ' ls && pwd \
		&& debconf-show postfix  '


  
# clean docker containers 
#
clean:   
	# remove this one.. 
	-docker rmi dkr382django2t_djangodev 
	-docker rmi dkr382r-django_djangodev
  # remove docker containers exited 
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 
	# remove tagged <none> 
	-docker rmi $$(docker images | grep "^<none>" | awk '{ print $3 }') 
  #volumes
	#careful.. -docker volume rm $$(docker volume ls -qf dangling=true)
	docker images
	docker network ls
	docker volume ls 
	docker ps -a
	docker ps 


perm3:
# fix permissions. make them group writable so www-data group can manage the files. move, delete, etc..  
	docker-compose run djangodev sh sc/fixpermsh

    
# having trouble setting env variable, but do I need it?  
#
perm2:  
	docker-compose run djangodev \
	bash -c "export fold=/myproject; chmod -R g+rws,o-w  $${fold}"

  

  
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# https://github.com/docker/compose/issues/2033 docker compose command line run sh multiple commands in one line
# $ requires escaping with $, so, $$
# continuation card  \
# - dash in front of command ignores error. -rm -f *.o
