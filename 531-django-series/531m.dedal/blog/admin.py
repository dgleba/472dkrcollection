from django.contrib import admin

# Register your models here.

# vim: set fileencoding=utf-8 :
from django.contrib import admin

from . import models

class PostAdmin(admin.ModelAdmin):

    list_display = ('id', 'title', 'body', 'last_updated', 'created')
    list_filter = (
        'last_updated',
        'created',
        'id',
        'title',
        'body',
        'last_updated',
        'created',
    )

def _register(model, admin_class):
    admin.site.register(model, admin_class)

_register(models.Post, PostAdmin)