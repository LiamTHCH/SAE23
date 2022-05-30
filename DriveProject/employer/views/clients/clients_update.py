from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy

from employer.models import Clients

class ClientsUpdateView(UpdateView):
    model = Clients
    fields = '__all__'
    template_name = "clients/clients_update.html"
    success_url = reverse_lazy('clients_list')
