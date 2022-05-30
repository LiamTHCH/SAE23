from django.test import TestCase
from django.urls import reverse

class CommandesDeleteTestCase(TestCase):
    def setUp(self):
        pass

    def test_commandes_delete_page(self):
        response = self.client.get(reverse('commandes_delete'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'commandes/commandes_delete.html')