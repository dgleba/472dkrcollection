from django.urls import path, include
from rest_framework import routers

from . import api
from . import views


router = routers.DefaultRouter()
router.register("book", api.bookViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("book-app/book/", views.bookListView.as_view(), name="book-app_book_list"),
    path("book-app/book/create/", views.bookCreateView.as_view(), name="book-app_book_create"),
    path("book-app/book/detail/<int:pk>/", views.bookDetailView.as_view(), name="book-app_book_detail"),
    path("book-app/book/update/<int:pk>/", views.bookUpdateView.as_view(), name="book-app_book_update"),
)
