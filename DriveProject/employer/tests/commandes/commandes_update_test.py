from django.test import TestCase
from django.urls import reverse

class CommandesUpdateTestCase(TestCase):
    def setUp(self):
        pass

    def test_commandes_update_page(self):
        response = self.client.get(reverse('commandes_update'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'commandes/commandes_update.html')