from django.contrib import admin
from django import forms

from . import models


class bookAdminForm(forms.ModelForm):

    class Meta:
        model = models.book
        fields = "__all__"


class bookAdmin(admin.ModelAdmin):
    form = bookAdminForm
    list_display = [
        "last_updated",
        "created",
        "author",
        "name",
    ]
    readonly_fields = [
        "last_updated",
        "created",
        "author",
        "name",
    ]


admin.site.register(models.book, bookAdmin)
