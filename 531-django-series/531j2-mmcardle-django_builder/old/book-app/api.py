from rest_framework import viewsets, permissions

from . import serializers
from . import models


class bookViewSet(viewsets.ModelViewSet):
    """ViewSet for the book class"""

    queryset = models.book.objects.all()
    serializer_class = serializers.bookSerializer
    permission_classes = [permissions.IsAuthenticated]
