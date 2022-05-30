from django.test import TestCase
from django.urls import reverse

class CommandesListTestCase(TestCase):
    def setUp(self):
        pass

    def test_commandes_list_page(self):
        response = self.client.get(reverse('commandes_list'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'commandes/commandes_list.html')