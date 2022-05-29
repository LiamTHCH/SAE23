from django.test import TestCase
from django.urls import reverse

class ClientsDetailTestCase(TestCase):
    def setUp(self):
        pass

    def test_clients_detail_page(self):
        response = self.client.get(reverse('clients_detail'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'clients/clients_detail.html')