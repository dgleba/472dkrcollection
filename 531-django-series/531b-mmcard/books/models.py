from django.db import models
from django.urls import reverse


class book(models.Model):

    # Fields
    last_updated = models.DateTimeField(auto_now=True, editable=False)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    author = models.TextField(max_length=100)
    name = models.TextField(max_length=100)

    class Meta:
        pass

    def __str__(self):
        return str(self.name)

    def get_absolute_url(self):
        return reverse("books_book_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("books_book_update", args=(self.pk,))
