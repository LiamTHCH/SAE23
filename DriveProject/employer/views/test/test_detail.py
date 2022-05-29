from django.views.generic import DetailView

from employer.models import Test


class TestDetailView(DetailView):
    model = Test
    template_name = "test/test_detail.html"
