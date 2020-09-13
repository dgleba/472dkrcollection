from rest_framework import viewsets, permissions

from . import serializers
from . import models


class PostViewSet(viewsets.ModelViewSet):
    """ViewSet for the Post class"""

    queryset = models.Post.objects.all()
    serializer_class = serializers.PostSerializer
    permission_classes = [permissions.IsAuthenticated]
