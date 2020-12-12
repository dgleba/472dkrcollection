from django import forms
from . import models


class bookForm(forms.ModelForm):
    class Meta:
        model = models.book
        fields = [
            "name",
            "author",
            # "created",
            # "last_updated",
        ]
