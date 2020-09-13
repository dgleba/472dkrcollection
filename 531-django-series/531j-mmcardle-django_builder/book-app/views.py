from django.views import generic
from . import models
from . import forms


class bookListView(generic.ListView):
    model = models.book
    form_class = forms.bookForm


class bookCreateView(generic.CreateView):
    model = models.book
    form_class = forms.bookForm


class bookDetailView(generic.DetailView):
    model = models.book
    form_class = forms.bookForm


class bookUpdateView(generic.UpdateView):
    model = models.book
    form_class = forms.bookForm
    pk_url_kwarg = "pk"
