from django.views.generic.edit import CreateView
from django.urls import reverse_lazy

from employer.models import Categories

class CategoriesCreateView(CreateView):
    model = Categories
    fields = '__all__'
    template_name = "categories/categories_create.html"
    success_url = reverse_lazy('categories_list')
