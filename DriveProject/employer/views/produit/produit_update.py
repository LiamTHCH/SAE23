from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy

from employer.models import Produits

class ProduitUpdateView(UpdateView):
    model = Produits
    fields = '__all__'
    template_name = "produit/produit_update.html"
    success_url = reverse_lazy('produit_list')
