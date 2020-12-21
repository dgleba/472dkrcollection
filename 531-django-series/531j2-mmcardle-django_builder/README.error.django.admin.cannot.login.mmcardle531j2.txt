
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  problem
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-12-11[Dec-Fri]17-09PM 

it is not picking up the .env file.

not sure why..
os.environ['DJANGO_SUPERUSER_PASSWORD']
'bb'


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-12-11[Dec-Fri]17-09PM 



https://www.pythonanywhere.com/forums/topic/27282/

from django.contrib.auth import authenticate
u = authenticate(username="admin", password="pass") 
u.email 
u.is_staff
True
u.is_active
True
u.is_superuser
True


from django.contrib.auth import get_user_model
email = "t@a.com"
password = "test"
u = get_user_model().objects.create_user("tuser", email, password)
get_user_model().objects.all()
u.email

from django.contrib.auth import authenticate
u = authenticate(username="a", password="a")
u = authenticate(username="tuser", password="test")
u.email


from django.contrib.auth import get_user_model
email = "t@a.com"
password = "aa"
u = get_user_model().objects.create_superuser("aa", email, password)
get_user_model().objects.all()
u.email


albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531j2-mmcardle-django_builder$  
   docker-compose run --rm djdev python manage.py createsuperuser --noinput --username bb --email=ad@a.com
Superuser created successfully.


from django.contrib.auth import get_user_model
u = get_user_model().objects.create_superuser("cc", a@a.com, "aa")



user.is_superuser=True
user.is_staff=True
user.save()


_____________

Please enter the correct username and password for a staff account. Note that both fields may be case-sensitive.
https://www.pythonanywhere.com/forums/topic/27282/

https://stackoverflow.com/questions/8844536/admin-page-on-django-is-broken
	drf?
	
# https://stackoverflow.com/questions/46913200/cant-authenticate-django-user-in-shell
# https://stackoverflow.com/questions/18503770/how-to-create-user-from-django-shell
# a]
# from django.contrib.auth.models import User
# settings.configure() 
# user=User.objects.create_user('cc', email="c@a.com", password='cc')
# user.is_superuser=True
# user.is_staff=True
# user.is_active = True
# user.save()

# b]
# works from shell, but not from docker-compose run. hmm....  u = get_user_model().objects.create_user("cc", a@a.com, "aa")
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate
user = get_user_model().objects.create_superuser("dd", "a@a.com", "aa")
# works. I can login to admin with user=dd pass=aa

c]
in .env  DJANGO_SUPERUSER_PASSWORD=aa
albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531j2-mmcardle-django_builder$     
	docker-compose run --rm djdev python manage.py createsuperuser --noinput --username ee --email=ee@a.com
Superuser created successfully.

from django.contrib.auth.models import User
user = users[0]
user.set_password('aa')

_____________


from django.test import TestCase

from django.contrib import auth
from .models import *

        self.u = UserProfile.objects.create_user('test@dom.com', 'iamtest', 'pass')
        self.u.is_staff = True
        self.u.is_superuser = True
        self.u.is_active = True
        self.u.save()

    def testLogin(self):
        self.client.login(username='test@dom.com', password='pass')

_____________


from django.contrib.auth.models import User
u = User.objects.filter(username="aa")
print(u)
print(u.pk)

Start by opening the Django shell from your terminal

> python manage.py shell

Then inside the Django shell, first get hold of that user object, then change the password and save.

from django.contrib.auth.models import User
u = User.objects.get(pk=id_of_desired_user)
u.set_password('new password')
u.save()

The user is looked up by primary key in this example. But the lookup can be based on user name, email or any other attribute.

#works..
from django.contrib.auth.models import User
u = User.objects.get(username="ff")
u.set_password('aa')
u.save()

in .env  DJANGO_SUPERUSER_PASSWORD=aa
albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531j2-mmcardle-django_builder$     
	docker-compose run --rm djdev python manage.py createsuperuser --noinput --username ee --email=ee@a.com
Superuser created successfully.



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-12-11[Dec-Fri]18-28PM 

import os
os.environ[var_name]

e=os.environ['DEBUG']
print(e)
e=os.environ['DJANGO_SUPERUSER_PASSWORD']
print(e)

>>> e=os.environ['DJANGO_SUPERUSER_PASSWORD']
>>> print(e)
bb
>>>

os.environ['DJANGO_SUPERUSER_PASSWORD']
'bb'



