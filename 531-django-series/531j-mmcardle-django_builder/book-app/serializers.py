from rest_framework import serializers

from . import models


class bookSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.book
        fields = [
            "last_updated",
            "created",
            "author",
            "name",
        ]
