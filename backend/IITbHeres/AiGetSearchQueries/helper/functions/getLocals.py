import requests



def getLocalShop(lat,long):
    reqUrl = f"https://browse.search.hereapi.com/v1/browse?at={str(lat)},{str(long)}&in=circle:{str(lat)},{str(long)};r=300&limit=100&lang=en&apiKey=cuj0o7HVeJ7R6ylDkWbuOw7MSUZlwS4cM-2CgRuVa-4"

    headersList = {
    "Accept": "*/*",
    }

    payload = ""

    response = requests.request("GET", reqUrl, data=payload,  headers=headersList)

    response = response.json()
    return response


if __name__ == "__main__":
    print(getLocalShop(19.129872, 72.918697))