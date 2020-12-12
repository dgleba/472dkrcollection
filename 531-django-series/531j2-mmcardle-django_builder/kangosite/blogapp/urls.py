from django.urls import path, include
from rest_framework import routers

from . import api
from . import views


router = routers.DefaultRouter()
router.register("book", api.bookViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("blogapp/book/", views.bookListView.as_view(), name="blogapp_book_list"),
    path("blogapp/book/create/", views.bookCreateView.as_view(), name="blogapp_book_create"),
    path("blogapp/book/detail/<int:pk>/", views.bookDetailView.as_view(), name="blogapp_book_detail"),
    path("blogapp/book/update/<int:pk>/", views.bookUpdateView.as_view(), name="blogapp_book_update"),
)
