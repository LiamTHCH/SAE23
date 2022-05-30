from django.test import TestCase
from django.urls import reverse

class ClientsDeleteTestCase(TestCase):
    def setUp(self):
        pass

    def test_clients_delete_page(self):
        response = self.client.get(reverse('clients_delete'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'clients/clients_delete.html')