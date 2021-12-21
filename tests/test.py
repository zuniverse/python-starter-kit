import unittest
import celery
import sys

sys.path.append("..")
from settings import environment

from src.supplier_pull_worker import call_worker_to_pull_data


class TestTasks(unittest.TestCase):

    def test_response_from_supplier_pull_data_is_of_celery_async_instance(self):
        url = 'https://dog.ceo/api/breeds/image/random'
        remote_data_to_test = call_worker_to_pull_data(url)
        self.assertIsInstance(remote_data_to_test, celery.result.AsyncResult)
        self.assertIn(remote_data_to_test.status, ('SUCCESS', 'PENDING'))

      
    # def test_message_sent_to_celery_is_in_rabbitmq(self):

if __name__ == '__main__':
    unittest.main()
