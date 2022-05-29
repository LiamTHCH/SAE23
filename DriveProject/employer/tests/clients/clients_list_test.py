from django.test import TestCase
from django.urls import reverse

class ClientsListTestCase(TestCase):
    def setUp(self):
        pass

    def test_clients_list_page(self):
        response = self.client.get(reverse('clients_list'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'clients/clients_list.html')