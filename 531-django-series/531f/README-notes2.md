
# one

2020-09-12_Sat_12.05-PM

  docker-compose run --rm djdev python manage.py startapp blog


# error

djdev_1  | /code/djangoproj/settings.py changed, reloading.
djdev_1  | Watching for file changes with StatReloader
djdev_1  | Performing system checks...
djdev_1  |
djdev_1  | Exception in thread django-main-thread:
djdev_1  | Traceback (most recent call last):
djdev_1  |   File "/usr/local/lib/python3.7/threading.py", line 926, in _bootstrap_inner
djdev_1  |     self.run()
djdev_1  |   File "/usr/local/lib/python3.7/threading.py", line 870, in run
djdev_1  |     self._target(*self._args, **self._kwargs)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/utils/autoreload.py", line 54, in wrapper
djdev_1  |     fn(*args, **kwargs)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/management/commands/runserver.py", line 117, in inner_run
djdev_1  |     self.check(display_num_errors=True)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/management/base.py", line 390, in check
djdev_1  |     include_deployment_checks=include_deployment_checks,
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/management/base.py", line 377, in _run_checks
djdev_1  |     return checks.run_checks(**kwargs)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/checks/registry.py", line 72, in run_checks
djdev_1  |     new_errors = check(app_configs=app_configs)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/checks/urls.py", line 40, in check_url_namespaces_unique
djdev_1  |     all_namespaces = _load_all_namespaces(resolver)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/core/checks/urls.py", line 57, in _load_all_namespaces
djdev_1  |     url_patterns = getattr(resolver, 'url_patterns', [])
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/utils/functional.py", line 80, in __get__
djdev_1  |     res = instance.__dict__[self.name] = self.func(instance)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/urls/resolvers.py", line 584, in url_patterns
djdev_1  |     patterns = getattr(self.urlconf_module, "urlpatterns", self.urlconf_module)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/utils/functional.py", line 80, in __get__
djdev_1  |     res = instance.__dict__[self.name] = self.func(instance)
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/django/urls/resolvers.py", line 577, in urlconf_module
djdev_1  |     return import_module(self.urlconf_name)
djdev_1  |   File "/usr/local/lib/python3.7/importlib/__init__.py", line 127, in import_module
djdev_1  |     return _bootstrap._gcd_import(name[level:], package, level)
djdev_1  |   File "<frozen importlib._bootstrap>", line 1006, in _gcd_import
djdev_1  |   File "<frozen importlib._bootstrap>", line 983, in _find_and_load
djdev_1  |   File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
djdev_1  |   File "<frozen importlib._bootstrap>", line 677, in _load_unlocked
djdev_1  |   File "<frozen importlib._bootstrap_external>", line 728, in exec_module
djdev_1  |   File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
djdev_1  |   File "/code/djangoproj/urls.py", line 24, in <module>
djdev_1  |     from cruds_adminlte.urls import crud_for_app
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/cruds_adminlte/urls.py", line 7, in <module>
djdev_1  |     from .crud import CRUDView, CRUDMixin
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/cruds_adminlte/crud.py", line 24, in <module>
djdev_1  |     from cruds_adminlte.filter import get_filters
djdev_1  |   File "/usr/local/lib/python3.7/site-packages/cruds_adminlte/filter.py", line 1, in <module>
djdev_1  |     import six
djdev_1  | ModuleNotFoundError: No module named 'six'
djdev_1  |
