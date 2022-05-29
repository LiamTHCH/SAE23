from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Clients

class ClientsCreateView(CreateView):
    model = Clients
    fields = '__all__'
    template_name = "clients/clients_create.html"
    success_url = reverse_lazy('clients_list')
