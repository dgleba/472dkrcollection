from django.urls import path, include
from rest_framework import routers

from . import api
from . import views


router = routers.DefaultRouter()
router.register("book", api.bookViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("books/book/", views.bookListView.as_view(), name="books_book_list"),
    path("books/book/create/", views.bookCreateView.as_view(), name="books_book_create"),
    path("books/book/detail/<int:pk>/", views.bookDetailView.as_view(), name="books_book_detail"),
    path("books/book/update/<int:pk>/", views.bookUpdateView.as_view(), name="books_book_update"),
)
