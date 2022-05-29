from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from employer.models import Commandes

class CommandesDeleteView(DeleteView):
    model = Commandes
    template_name = "commandes/commandes_delete.html"
    success_url = reverse_lazy('commandes_list')