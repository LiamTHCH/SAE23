from django.test import TestCase
from django.urls import reverse

class CommandesCreateTestCase(TestCase):
    def setUp(self):
        pass

    def test_commandes_create_page(self):
        response = self.client.get(reverse('commandes_create'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'commandes/commandes_create.html')