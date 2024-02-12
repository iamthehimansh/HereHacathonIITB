import json
from django.views.decorators.csrf import csrf_exempt
from .helper.functions.Suggest import Suggession, TourPlan
from django.http import JsonResponse
# import jsonresponce
import requests as req



# Give all search queries to the user for the given search query from open ai
@csrf_exempt
def ShowSuggession(request):
    if request.method=="POST":
        userTask = request.POST.get('userTask')
        lat = request.POST.get('lat')
        long = request.POST.get('long')
        data = Suggession(userTask, lat, long)
        print(data)
        return JsonResponse(json.loads(data),safe=False)
    return {
        "error":True,
        "msg":"Use of only post req is valid here"
    }


@csrf_exempt
def PlanATrip(request):
    if request.method=="POST":
        
        mess=""
        data= list(json.loads(request.POST.get('mess')))
        print(data)
        for i in data:
            mess+=i["text"]+"\n"
        data=json.loads(TourPlan(mess))
        # data=[{'day': 1, 'tour': [{'text': 'Sunset view at Hatu Peak', 'location': 'Hatu Peak'}, {'text': 'Magical views of orchards in Ratnari', 'location': 'Ratnari orchards'}]}, {'day': 2, 'tour': [{'text': 'Enjoy snowfall at Hatu Temple', 'location': 'Hatu Temple'}, {'text': 'Explore the beauty of Sarahan village', 'location': 'Sarahan village'}]}]
        data2=data
        for i_i,i in enumerate(data):
            for j_j,j in enumerate(i["tour"]):
                
                r=req.get("https://api.pexels.com/v1/search?query="+j["text"],headers={
                    "Authorization":"QgMNM2gjscjoce00MZPM9qkjrBDmKKtSpStgEKarcy1TdyUWoVHgMhAp"
                })
                r=r.json()
                
                data2[i_i]["tour"][j_j]["bg"]=r["photos"][0]["src"]["original"]
        print(data2)
        return JsonResponse( data2,safe=False)
    return {
        "error":True,
        "msg":"Use of only post req is valid here"
    }
