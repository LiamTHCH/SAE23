from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from employer.models import Produits

class ProduitDeleteView(DeleteView):
    model = Produits
    template_name = "produit/produit_delete.html"
    success_url = reverse_lazy('produit_list')