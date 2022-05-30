from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Produits

class ProduitCreateView(CreateView):
    model = Produits
    fields = '__all__'
    template_name = "produit/produit_create.html"
    success_url = reverse_lazy('produit_list')
