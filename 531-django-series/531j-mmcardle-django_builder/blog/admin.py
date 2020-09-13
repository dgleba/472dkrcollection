from django.contrib import admin
from django import forms

from . import models


class PostAdminForm(forms.ModelForm):

    class Meta:
        model = models.Post
        fields = "__all__"


class PostAdmin(admin.ModelAdmin):
    form = PostAdminForm
    list_display = [
        "created",
        "a",
        "body",
        "title",
        "last_updated",
    ]
    readonly_fields = [
        "created",
        "a",
        "body",
        "title",
        "last_updated",
    ]


admin.site.register(models.Post, PostAdmin)
