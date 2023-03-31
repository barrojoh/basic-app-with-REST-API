import requests
import json

print("Connecting to server...")
# back4app credentials set up DO NOT CHANGE
app_id = 'xuG1l3SQ6c25LgrWBvZC49Pyzf55DA7U6s5i1c0K'
rest_api_key = '09csr3BD8VhRj1gbMW49FGHatNUiBwPlPEnU8G1y'
api_endpoint = f'https://parseapi.back4app.com/classes/Todo'

# Header holding back4app parse server credentials DO NOT CHANGE
headers = {
    'X-Parse-Application-Id': app_id,
    'X-Parse-REST-API-Key': rest_api_key,
    'Content-Type': 'application/json'
}

# get request, requesting all data from server
response = requests.get(api_endpoint, headers=headers)
results = response.json()['results']
print("Connected to server...")

print(json.dumps(results, indent=4))#format data
#printing first object person and status
print("Title: ", results[0]['title'])
print("Status: ", results[0]['done'])
#print request status code
print("Status code: ",response.status_code)
# Update object
print("Updating server...")
#id set to first objects id
id = results[0]['objectId']
#new data
data = {
    'title': 'Vladimir Puente',
    'done': True
}
#PUT requests, updates object data with new data
response = requests.put(api_endpoint + '/' + id, headers=headers, data=json.dumps(data))
#PUT request status code
print("Status Code: ",response.status_code)

#GET request showing changes after PUT request
response = requests.get(api_endpoint, headers=headers)
results = response.json()['results']
print(json.dumps(results, indent=4))





