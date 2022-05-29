from django.test import TestCase
from django.urls import reverse

class ClientsUpdateTestCase(TestCase):
    def setUp(self):
        pass

    def test_clients_update_page(self):
        response = self.client.get(reverse('clients_update'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'clients/clients_update.html')