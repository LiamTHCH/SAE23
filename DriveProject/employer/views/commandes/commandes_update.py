from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy

from employer.models import Commandes

class CommandesUpdateView(UpdateView):
    model = Commandes
    fields = '__all__'
    template_name = "commandes/commandes_update.html"
    success_url = reverse_lazy('commandes_list')
