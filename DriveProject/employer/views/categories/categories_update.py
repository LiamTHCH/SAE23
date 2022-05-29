from django.views.generic.edit import UpdateView
from django.urls import reverse_lazy

from employer.models import Categories

class CategoriesUpdateView(UpdateView):
    model = Categories
    fields = '__all__'
    template_name = "categories/categories_update.html"
    success_url = reverse_lazy('categories_list')
