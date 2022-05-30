from django.test import TestCase
from django.urls import reverse

class CategoriesDetailTestCase(TestCase):
    def setUp(self):
        pass

    def test_categories_detail_page(self):
        response = self.client.get(reverse('categories_detail'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'categories/categories_detail.html')