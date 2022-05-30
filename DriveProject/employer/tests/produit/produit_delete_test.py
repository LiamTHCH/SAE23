from django.test import TestCase
from django.urls import reverse

class ProduitDeleteTestCase(TestCase):
    def setUp(self):
        pass

    def test_produit_delete_page(self):
        response = self.client.get(reverse('produit_delete'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'produit/produit_delete.html')