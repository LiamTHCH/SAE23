from django.test import TestCase
from django.urls import reverse

class ProduitListTestCase(TestCase):
    def setUp(self):
        pass

    def test_produit_list_page(self):
        response = self.client.get(reverse('produit_list'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'produit/produit_list.html')