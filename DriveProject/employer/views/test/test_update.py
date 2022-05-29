from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy

from employer.models import Test

class TestUpdateView(UpdateView):
    model = Test
    fields = '__all__'
    template_name = "test/test_update.html"
    success_url = reverse_lazy('test_list')
