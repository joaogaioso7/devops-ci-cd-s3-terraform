import json

def lambda_handler(event, context):

    mensagem = "Hello from Lambda created by Terraform CI/CD"
    print(mensagem)
    
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda created by Terraform!')
    }

