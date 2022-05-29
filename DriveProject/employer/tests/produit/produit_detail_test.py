from django.test import TestCase
from django.urls import reverse

class ProduitDetailTestCase(TestCase):
    def setUp(self):
        pass

    def test_produit_detail_page(self):
        response = self.client.get(reverse('produit_detail'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'produit/produit_detail.html')