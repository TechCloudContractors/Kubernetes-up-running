import json,csv,argparse,requests,time
from Model.BillingResponse import  BillingResponse
from Helpers.Azure import fetch_management_token
from Helpers.Constants import requestbody


def mkdate(datestr):
  try:
    time.strptime(datestr, '%Y-%m-%d')
    return datestr
  except ValueError:
    raise argparse.ArgumentTypeError(datestr + ' is not a proper date string')

parser=argparse.ArgumentParser()
parser.add_argument('StartDate',type=mkdate)
parser.add_argument('EndDate',type=mkdate)
parser.add_argument('SubscriptionGuid')
args=parser.parse_args()

subscriptionguid=args.SubscriptionGuid
startdate=str(args.StartDate).strip('"').strip("'")
enddate=str(args.EndDate).strip('"').strip("'")

token=fetch_management_token()
url = f"https://management.azure.com/subscriptions/{subscriptionguid}/providers/Microsoft.CostManagement/query?api-version=2021-10-01"
payload=requestbody(startdate,enddate)

headers = {
  'Authorization': f'Bearer {token}',
  'Content-Type': 'application/json'
}


def makeapirequest(url,headers,payload):
    print(len(url))
    response = requests.request("POST", url, headers=headers, data=payload)
    if response.status_code == 200:
            billingdata_dict = json.loads(response.text)
            billing_object = BillingResponse(**billingdata_dict)      
            if len(billing_object.properties["nextLink"]) != 0:
                record = makeapirequest(billing_object.properties["nextLink"],headers,payload)
                billing_object.properties["rows"].extend(record.properties["rows"])                                 
            return billing_object
    else:
            raise Exception('Request failed with ',response.status_code,' - ',
                response.text)

billing_object = makeapirequest(url, headers=headers, payload=payload)

with open(f'BillingData_{startdate}_{enddate}.csv', 'w', newline='') as f:
  writer = csv.writer(f)
  headers = [d['name'] for d in billing_object.properties["columns"]]
  writer.writerow(i for i in headers)
  print(billing_object.properties["nextLink"])
  writer.writerows(billing_object.properties["rows"])
