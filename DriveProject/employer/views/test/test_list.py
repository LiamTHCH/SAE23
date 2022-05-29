from django.views.generic import ListView

from employer.models import Test

class TestListView(ListView):
    model = Test
    template_name = "test/test_list.html"
