from rest_framework import serializers

from . import models


class bookSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.book
        fields = [
            "name",
            "author",
            # "created",
            # "last_updated",
        ]
