from django.views import generic
from . import models
from . import forms


class PostListView(generic.ListView):
    model = models.Post
    form_class = forms.PostForm


class PostCreateView(generic.CreateView):
    model = models.Post
    form_class = forms.PostForm


class PostDetailView(generic.DetailView):
    model = models.Post
    form_class = forms.PostForm


class PostUpdateView(generic.UpdateView):
    model = models.Post
    form_class = forms.PostForm
    pk_url_kwarg = "pk"
