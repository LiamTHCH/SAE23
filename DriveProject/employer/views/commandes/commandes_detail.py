from django.views.generic import DetailView

from employer.models import Commandes


class CommandesDetailView(DetailView):
    model = Commandes
    template_name = "commandes/commandes_detail.html"
