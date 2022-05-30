from django.views.generic.edit import DeleteView
from django.urls import reverse_lazy

from employer.models import Categories

class CategoriesDeleteView(DeleteView):
    model = Categories
    template_name = "categories/categories_delete.html"
    success_url = reverse_lazy('categories_list')