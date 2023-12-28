import requests


requests.packages.urllib3.disable_warnings()



def getSearchQueries(queries, lat, long):
    # reqUrl = f"https://discover.search.hereapi.com/v1/discover?in=circle:,;r&limit=100&lang=en&apiKey=cuj0o7HVeJ7R6ylDkWbuOw7MSUZlwS4cM-2CgRuVa-4&q={queries}"
    reqUrl = f"https://discover.search.hereapi.com/v1/discover?in=circle:{str(lat)},{str(long)};r=500&apiKey=cuj0o7HVeJ7R6ylDkWbuOw7MSUZlwS4cM-2CgRuVa-4&q={queries}"
    print(reqUrl) 
    headersList = {
    "Accept": "*/*"
    }

    payload = ''

    response = requests.request("GET", reqUrl, data=payload,  headers=headersList)
    response = response.json()
    return response
if __name__ == "__main__":
    print(getSearchQueries("Pizza", 19.135032, 72.906146))