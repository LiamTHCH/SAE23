from django.test import TestCase
from django.urls import reverse

class CommandesDetailTestCase(TestCase):
    def setUp(self):
        pass

    def test_commandes_detail_page(self):
        response = self.client.get(reverse('commandes_detail'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'commandes/commandes_detail.html')