from django.views.generic import DetailView

from employer.models import Categories


class CategoriesDetailView(DetailView):
    model = Categories
    template_name = "categories/categories_detail.html"
