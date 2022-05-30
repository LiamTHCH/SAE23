from django.views.generic import ListView

from employer.models import Categories

class CategoriesListView(ListView):
    model = Categories
    template_name = "categories/categories_list.html"
