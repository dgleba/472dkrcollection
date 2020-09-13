from django.db import models

# Create your models here.

# from django.db import models
from django.urls import reverse



from dedal.decorators import crud

@crud
class Post(models.Model):

    # Fields
    title = models.CharField(max_length=100)
    body = models.TextField(max_length=5100)

    last_updated = models.DateTimeField()
    created = models.DateTimeField()

    # last_updated = models.DateTimeField(auto_now=True, editable=False)
    # created = models.DateTimeField(auto_now_add=True, editable=False)
    # last_updated = models.DateTimeField(auto_now=True, editable=True)
    # created = models.DateTimeField(auto_now_add=True, editable=True)

    class Meta:
        pass

    def __str__(self):
        return str(self.pk)

    def get_absolute_url(self):
        return reverse("blog_Post_detail", args=(self.pk,))

    def get_update_url(self):
        return reverse("blog_Post_update", args=(self.pk,))
