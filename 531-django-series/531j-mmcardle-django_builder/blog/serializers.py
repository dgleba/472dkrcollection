from rest_framework import serializers

from . import models


class PostSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Post
        fields = [
            "created",
            "a",
            "body",
            "title",
            "last_updated",
        ]
