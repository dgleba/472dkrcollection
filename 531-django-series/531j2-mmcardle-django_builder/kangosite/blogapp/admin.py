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
        "name",
        "author",
        "created",
        "last_updated",
    ]
    readonly_fields = [
        "name",
        "author",
        "created",
        "last_updated",
    ]


admin.site.register(models.book, bookAdmin)
