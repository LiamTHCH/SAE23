from django.test import TestCase
from django.urls import reverse

class CategoriesListTestCase(TestCase):
    def setUp(self):
        pass

    def test_categories_list_page(self):
        response = self.client.get(reverse('categories_list'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'categories/categories_list.html')