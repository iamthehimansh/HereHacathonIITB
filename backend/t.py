import json


k={
    "title": "Sanskar Tower",
    "id": "here:pds:place:356te7ug-84d54d3929c942308e98c8e718eaf61f",
    "language": "en",
    "resultType": "place",
    "address": {
    "label": "Sanskar Tower, Main Gate Road, Iit Area-Students Residential Zone, Powai, Mumbai 400076, India",
    "countryCode": "IND",
    "countryName": "India",
    "stateCode": "MH",
    "state": "Maharashtra",
    "county": "Mumbai Suburban",
    "city": "Mumbai",
    "district": "Powai",
    "subdistrict": "Iit Area-Students Residential Zone",
    "street": "Main Gate Road",
    "postalCode": "400076"
    },
    "position": {
    "lat": 19.13516,
    "lng": 72.90615
    },
    "access": [
    {
        "lat": 19.1354,
        "lng": 72.9062
    }
    ],
    "distance": 14,
    "categories": [
    {
        "id": "500-5100-0055",
        "name": "Hostel",
        "primary": True
    }
    ]
}

k["title"]
k["categories"][0]["name"]
k["distance"]
f=json.load(open("test.json"))
np=[]
for i in f["nearbyPlaces"]:
    z={
        "title":i["title"],
        "category":i["categories"][0]["name"],
        "distance":i["distance"]
    }
    np.append(z)
f["nearbyPlaces"]=np
json.dump(f,open("test.json","w"))

