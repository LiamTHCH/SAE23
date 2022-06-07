from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Commandes

class CommandesCreateView(CreateView):
    model = Commandes
    fields = '__all__'
    template_name = "commandes/commandes_create.html"
    def get_success_url(self):
        return reverse_lazy('commandes_show',args=(self.object.id,))
