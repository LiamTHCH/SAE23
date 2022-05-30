from django.test import TestCase
from django.urls import reverse

class CategoriesDeleteTestCase(TestCase):
    def setUp(self):
        pass

    def test_categories_delete_page(self):
        response = self.client.get(reverse('categories_delete'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'categories/categories_delete.html')