from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Commandes

class CommandesCreateView(CreateView):
    model = Commandes
    fields = '__all__'
    template_name = "commandes/commandes_create.html"
    success_url = reverse_lazy('commandes_list')
