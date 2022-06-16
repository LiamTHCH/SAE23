from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from django.shortcuts import render
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from employer.models import Produits

class ProduitCreateView(CreateView):
    model = Produits
    fields = '__all__'
    template_name = "produit.html"
    success_url = reverse_lazy('produit_list')
