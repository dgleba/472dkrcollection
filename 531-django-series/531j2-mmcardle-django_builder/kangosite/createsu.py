
# 2020-12-11_Fri_17.49-PM
# error:

# albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531j2-mmcardle-django_builder$     docker-compose run --rm djdev python  createsu.py
#     Traceback (most recent call last):
#   File "createsu.py", line 8, in <module>
#     from django.contrib.auth.models import User
#   File "/usr/local/lib/python3.7/site-packages/django/contrib/auth/models.py", line 2, in <module>
#     from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
#   File "/usr/local/lib/python3.7/site-packages/django/contrib/auth/base_user.py", line 47, in <module>
#     class AbstractBaseUser(models.Model):
#   File "/usr/local/lib/python3.7/site-packages/django/db/models/base.py", line 103, in __new__
#     app_config = apps.get_containing_app_config(module)
#   File "/usr/local/lib/python3.7/site-packages/django/apps/registry.py", line 252, in get_containing_app_config
#     self.check_apps_ready()
#   File "/usr/local/lib/python3.7/site-packages/django/apps/registry.py", line 134, in check_apps_ready
#     settings.INSTALLED_APPS
#   File "/usr/local/lib/python3.7/site-packages/django/conf/__init__.py", line 79, in __getattr__
#     self._setup(name)
#   File "/usr/local/lib/python3.7/site-packages/django/conf/__init__.py", line 64, in _setup
#     % (desc, ENVIRONMENT_VARIABLE))
# django.core.exceptions.ImproperlyConfigured: Requested setting INSTALLED_APPS, but settings are not configured. You must either define the environment variable DJANGO_SETTINGS_MODULE or call settings.configure() before accessing settings.
# albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531j2-mmcardle-django_builder$





from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate


# https://stackoverflow.com/questions/46913200/cant-authenticate-django-user-in-shell
# https://stackoverflow.com/questions/18503770/how-to-create-user-from-django-shell

from django.contrib.auth.models import User

# settings.configure() 

user=User.objects.create_user('cc', email="c@a.com", password='cc')
# works from shell, but not from docker-compose run. hmm....  u = get_user_model().objects.create_user("cc", "a@a.com", "aa")
user.is_superuser=True
user.is_staff=True
user.is_active = True
user.save()



# examples:

# no.. u = create_superuser("cc", a@a.com, "aa")

# user = get_user_model().objects.create_user("TestUser", email, password)
# user.is_active = True
# user.save()

