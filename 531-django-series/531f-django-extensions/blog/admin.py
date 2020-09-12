from django.contrib import admin

# Register your models here.

# -*- coding: utf-8 -*-
from django.contrib import admin

from .models import Post


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('id',  'body', 'title', 'last_updated','created',)
    list_filter = ('id', 'created', 'body', 'title', 'last_updated')
