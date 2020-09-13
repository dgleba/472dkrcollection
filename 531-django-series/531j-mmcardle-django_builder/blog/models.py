from django.db import models
from django.urls import reverse


class Post(models.Model):

    # Fields
    created = models.DateTimeField(auto_now_add=True, editable=False)
    a = models.CharField(max_length=30)
    body = models.TextField(max_length=5100)
    title = models.CharField(max_length=130)
    last_updated = models.DateTimeField(auto_now=True, editable=False)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("blog_Post_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blog_Post_update", args=(self.pk,))
