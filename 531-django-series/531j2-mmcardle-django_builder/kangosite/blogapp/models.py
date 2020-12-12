from django.db import models
from django.urls import reverse


class book(models.Model):

    # Fields
    name = models.TextField()
    author = models.TextField(blank=True)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.name)

    def get_absolute_url(self):
        return reverse("blogapp_book_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blogapp_book_update", args=(self.pk,))
