from django.test import TestCase
from django.urls import reverse

class ClientsCreateTestCase(TestCase):
    def setUp(self):
        pass

    def test_clients_create_page(self):
        response = self.client.get(reverse('clients_create'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'clients/clients_create.html')