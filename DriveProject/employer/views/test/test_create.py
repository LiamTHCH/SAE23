from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Test

class TestCreateView(CreateView):
    model = Test
    fields = '__all__'
    template_name = "test/test_create.html"
    success_url = reverse_lazy('test_list')
