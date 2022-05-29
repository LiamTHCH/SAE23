from django.test import TestCase
from django.urls import reverse

class ProduitCreateTestCase(TestCase):
    def setUp(self):
        pass

    def test_produit_create_page(self):
        response = self.client.get(reverse('produit_create'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'produit/produit_create.html')