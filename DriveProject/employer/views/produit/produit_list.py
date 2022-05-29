from django.views.generic import ListView

from employer.models import Produits

class ProduitListView(ListView):
    model = Produits
    template_name = "produit/produit_list.html"
