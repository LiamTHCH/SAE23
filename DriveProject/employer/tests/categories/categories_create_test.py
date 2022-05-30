from django.test import TestCase
from django.urls import reverse

class CategoriesCreateTestCase(TestCase):
    def setUp(self):
        pass

    def test_categories_create_page(self):
        response = self.client.get(reverse('categories_create'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'categories/categories_create.html')