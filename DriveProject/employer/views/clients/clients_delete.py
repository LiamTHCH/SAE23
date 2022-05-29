from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from employer.models import Clients

class ClientsDeleteView(DeleteView):
    model = Clients
    template_name = "clients/clients_delete.html"
    success_url = reverse_lazy('clients_list')