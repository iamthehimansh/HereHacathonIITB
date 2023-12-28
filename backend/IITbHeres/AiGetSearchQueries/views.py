import json
from django.views.decorators.csrf import csrf_exempt
from .helper.functions.Suggest import Suggession
from django.http import JsonResponse
# import jsonresponce



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
