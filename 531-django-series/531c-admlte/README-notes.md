# Notes


# 2020-09-12_Sat_11.34-AM

django-cruds-adminlte 0.0.17+git.9110c69 requires django-crispy-forms==1.7.2, but you'll have django-crispy-forms 1.9.2 which is incompatible.
django-cruds-adminlte 0.0.17+git.9110c69 requires djangoajax==2.3.7, but you'll have djangoajax 3.2 which is incompatible.



ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.
We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.
django-cruds-adminlte 0.0.17+git.9110c69 requires django-crispy-forms==1.7.2, but you'll have django-crispy-forms 1.9.2 which is incompatible.
django-cruds-adminlte 0.0.17+git.9110c69 requires djangoajax==2.3.7, but you'll have djangoajax 3.2 which is incompatible.
Successfully installed django-2.2.16 django-appconf-1.0.4 django-crispy-forms-1.9.2 django-cruds-adminlte-0.0.17+git.9110c69 django-image-cropping-1.4.0 django-mysql-2.4.1 django-utils-six-2.0 djangoajax-3.2 easy-thumbnails-2.7 gunicorn-19.9.0 mysqlclient-1.4.6 pillow-7.2.0 python-dotenv-0.10.3 pytz-2020.1 sqlparse-0.3.1
WARNING: You are using pip version 20.2.2; however, version 20.2.3 is available.
You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.
Removing intermediate container 5be5481a18b6
 ---> 245cdbe071a1
Successfully built 245cdbe071a1
Successfully tagged 531c-admlte_djdev:latest
albe@vamp398:/srv/dkr/472dkrcollection/531-django-series/531c-admlte$ 



# 2020-09-12


django-cruds-adminlte ModuleNotFoundError No module named 'six'



pip install django-crispy-forms
pip install easy-thumbnails
pip install django-image-cropping
pip install djangoajax


django-crispy-forms
easy-thumbnails
django-image-cropping
djangoajax





# error

```
albe@pmdsdata7:/srv/file/test/472dkrcollection/499d-django$ docker-compose run --rm djan python manage.py collectstatic

You have requested to collect static files at the destination
location as specified in your settings.

This will overwrite existing files!
Are you sure you want to do this?

Type 'yes' to continue, or 'no' to cancel: yes
Traceback (most recent call last):
  File "manage.py", line 21, in <module>
    main()
  File "manage.py", line 17, in main
    execute_from_command_line(sys.argv)
  File "/usr/local/lib/python3.7/site-packages/django/core/management/__init__.py", line 381, in execute_from_command_line
    utility.execute()
  File "/usr/local/lib/python3.7/site-packages/django/core/management/__init__.py", line 375, in execute
    self.fetch_command(subcommand).run_from_argv(self.argv)
  File "/usr/local/lib/python3.7/site-packages/django/core/management/base.py", line 323, in run_from_argv
    self.execute(*args, **cmd_options)
  File "/usr/local/lib/python3.7/site-packages/django/core/management/base.py", line 364, in execute
    output = self.handle(*args, **options)
  File "/usr/local/lib/python3.7/site-packages/django/contrib/staticfiles/management/commands/collectstatic.py", line 188, in handle
    collected = self.collect()
  File "/usr/local/lib/python3.7/site-packages/django/contrib/staticfiles/management/commands/collectstatic.py", line 114, in collect
    handler(path, prefixed_path, storage)
  File "/usr/local/lib/python3.7/site-packages/django/contrib/staticfiles/management/commands/collectstatic.py", line 342, in copy_file
    if not self.delete_file(path, prefixed_path, source_storage):
  File "/usr/local/lib/python3.7/site-packages/django/contrib/staticfiles/management/commands/collectstatic.py", line 249, in delete_file
    if self.storage.exists(prefixed_path):
  File "/usr/local/lib/python3.7/site-packages/django/core/files/storage.py", line 310, in exists
    return os.path.exists(self.path(name))
  File "/usr/local/lib/python3.7/site-packages/django/contrib/staticfiles/storage.py", line 44, in path
    raise ImproperlyConfigured("You're using the staticfiles app "
django.core.exceptions.ImproperlyConfigured: You're using the staticfiles app without having set the STATIC_ROOT setting to a filesystem path.
albe@pmdsdata7:/srv/file/test/472dkrcollection/499d-django$

```


# Django tutorial app code


## 2.0 - 3.0

ggl: django tutorial 3.0 download polls example


1.

https://github.com/krzysieqq/Django-poll-app

Django 1.10 poll app tutorial


2.

https://github.com/divio/django-polls

no mysite.

3.

https://github.com/deployment-from-scratch/django-2.2-polls

seems good.




## 1.8

Search: django tutorial 1.8 download polls


1.

https://github.com/SanketDG/django-polls

Following the Django 1.8 Tutorial https://docs.djangoproject.com/en/1.8/intro/tutorial01/


2.

https://github.com/hezhao/django-polls

Django 1.8 tutorial app with Python 3.5 https://docs.djangoproject.com/en/1.8…

Following the Django 1.8 Tutorial https://docs.djangoproject.com/en/1.8/intro/tutorial01/
