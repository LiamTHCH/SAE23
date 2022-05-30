from django.test import TestCase
from django.urls import reverse

class ProduitUpdateTestCase(TestCase):
    def setUp(self):
        pass

    def test_produit_update_page(self):
        response = self.client.get(reverse('produit_update'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'produit/produit_update.html')