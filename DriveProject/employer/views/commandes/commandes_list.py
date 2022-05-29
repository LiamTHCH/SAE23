from django.views.generic import ListView

from employer.models import Commandes

class CommandesListView(ListView):
    model = Commandes
    template_name = "commandes/commandes_list.html"
