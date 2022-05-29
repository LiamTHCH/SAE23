from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from employer.models import Test

class TestDeleteView(DeleteView):
    model = Test
    template_name = "test/test_delete.html"
    success_url = reverse_lazy('test_list')