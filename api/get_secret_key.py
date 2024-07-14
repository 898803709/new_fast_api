import json
import boto3
from botocore.exceptions import ClientError


class AWSClient:
    @classmethod
    def get_secret(cls, secret_name: str, key_name: str) -> str:
        secret_name = secret_name
        region_name = "ap-northeast-1"

        # Create a Secrets Manager client
        session = boto3.session.Session()
        client = session.client(service_name="secretsmanager", region_name=region_name)

        try:
            get_secret_value_response = client.get_secret_value(SecretId=secret_name)
        except ClientError as e:
            raise e

        secret = json.loads(get_secret_value_response["SecretString"])
        return secret[key_name]


print(AWSClient.get_secret("openai", "OpenAI"))
