import pytest
import test_helpers

from django.urls import reverse
from django.test import Client


pytestmark = [pytest.mark.django_db]


def tests_book_list_view():
    instance1 = test_helpers.create_blogapp_book()
    instance2 = test_helpers.create_blogapp_book()
    client = Client()
    url = reverse("blogapp_book_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_book_create_view():
    client = Client()
    url = reverse("blogapp_book_create")
    data = {
        "name": "text",
        "author": "text",
        "created": datetime.now(),
        "last_updated": datetime.now(),
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_book_detail_view():
    client = Client()
    instance = test_helpers.create_blogapp_book()
    url = reverse("blogapp_book_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_book_update_view():
    client = Client()
    instance = test_helpers.create_blogapp_book()
    url = reverse("blogapp_book_update", args=[instance.pk, ])
    data = {
        "name": "text",
        "author": "text",
        "created": datetime.now(),
        "last_updated": datetime.now(),
    }
    response = client.post(url, data)
    assert response.status_code == 302
