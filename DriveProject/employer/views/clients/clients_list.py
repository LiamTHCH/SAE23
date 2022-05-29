from django.views.generic import ListView

from employer.models import Clients

class ClientsListView(ListView):
    model = Clients
    template_name = "clients/clients_list.html"
