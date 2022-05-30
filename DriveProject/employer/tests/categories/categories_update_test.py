from django.test import TestCase
from django.urls import reverse

class CategoriesUpdateTestCase(TestCase):
    def setUp(self):
        pass

    def test_categories_update_page(self):
        response = self.client.get(reverse('categories_update'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'categories/categories_update.html')