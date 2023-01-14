import json

def run(event, lambda_context):
    print('request: {}'.format(json.dumps(event)))
n    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'text/plain'
        },
        'body': 'Test Lambda. event = {}\n'.format(event)
    }
