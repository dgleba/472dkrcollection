import pytest
import test_helpers

from django.urls import reverse
from django.test import Client


pytestmark = [pytest.mark.django_db]


def tests_Post_list_view():
    instance1 = test_helpers.create_blog_Post()
    instance2 = test_helpers.create_blog_Post()
    client = Client()
    url = reverse("blog_Post_list")
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance1) in response.content.decode("utf-8")
    assert str(instance2) in response.content.decode("utf-8")


def tests_Post_create_view():
    client = Client()
    url = reverse("blog_Post_create")
    data = {
        "a": "text",
        "body": "text",
        "title": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302


def tests_Post_detail_view():
    client = Client()
    instance = test_helpers.create_blog_Post()
    url = reverse("blog_Post_detail", args=[instance.pk, ])
    response = client.get(url)
    assert response.status_code == 200
    assert str(instance) in response.content.decode("utf-8")


def tests_Post_update_view():
    client = Client()
    instance = test_helpers.create_blog_Post()
    url = reverse("blog_Post_update", args=[instance.pk, ])
    data = {
        "a": "text",
        "body": "text",
        "title": "text",
    }
    response = client.post(url, data)
    assert response.status_code == 302
