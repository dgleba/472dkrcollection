from django.urls import path, include
from rest_framework import routers

from . import api
from . import views


router = routers.DefaultRouter()
router.register("Post", api.PostViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("blog/Post/", views.PostListView.as_view(), name="blog_Post_list"),
    path("blog/Post/create/", views.PostCreateView.as_view(), name="blog_Post_create"),
    path("blog/Post/detail/<int:pk>/", views.PostDetailView.as_view(), name="blog_Post_detail"),
    path("blog/Post/update/<int:pk>/", views.PostUpdateView.as_view(), name="blog_Post_update"),
)
