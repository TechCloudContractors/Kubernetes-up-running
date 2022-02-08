import requests


def fetch_management_token():
    url = "https://login.microsoftonline.com/<TenantID>/oauth2/token"

    payload='grant_type=client_credentials&client_id=<clientID>&client_secret=<ClientSecret>&resource=https%3A%2F%2Fmanagement.core.windows.net%2F'
    headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
    response = requests.request("POST", url, headers=headers, data=payload)
    return response.json()["access_token"]
