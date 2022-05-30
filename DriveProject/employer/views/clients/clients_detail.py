from django.views.generic import DetailView

from employer.models import Clients


class ClientsDetailView(DetailView):
    model = Clients
    template_name = "clients/clients_detail.html"
