from django.views.generic import DetailView

from employer.models import Produits


class ProduitDetailView(DetailView):
    model = Produits
    template_name = "produit/produit_detail.html"
