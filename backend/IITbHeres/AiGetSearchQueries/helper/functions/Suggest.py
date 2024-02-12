from openai import OpenAI
import os,json
# from .getLocals import getLocalShop
OPENAI_API_KEY=os.environ.get("OPENAI_API_KEY")
file=open("/Users/iamthehimansh/Programing/heres_hacathon_iitb_team_5g_only/backend/story.txt","r")
SYSTEMPROMPT=file.read()
file.close()
file=open("/Users/iamthehimansh/Programing/heres_hacathon_iitb_team_5g_only/backend/story2.txt","r")
SYSTEMPROMPT=file.read()
file.close()
USERPROMPTTEMPLATE=json.load(open("/Users/iamthehimansh/Programing/heres_hacathon_iitb_team_5g_only/backend/test.json","r"))


client = OpenAI(api_key="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")
# USERPROMPTTEMPLATE=settings.USERPROMPTTEMPLATE
# Give all search queries to the user for the given search query from open ai
def Suggession(userTask, lat, long)->str:
    shops={}
    # getLocalShop(lat,long)
    np=[]
    f={}
    # input("Press Enter to continue...")
    for i in shops["items"]:
        try:
            z={
                "title":i["title"],
                "category":i["categories"][0]["name"],
                "distance":i["distance"]
            }
            np.append(z)
        except:
            print(i)
            np.append(i)
    print(len(np),len(shops["items"]))
    f["nearbyPlaces"]=np
    f['tasks']=userTask
    completion = client.chat.completions.create(
    model="gpt-3.5-turbo-16k",
    messages=[
        {"role": "system", "content": SYSTEMPROMPT},
        {"role": "user", "content": str(f)+"\n Return all posible task that can be done in the given location in an array or list"},
    ],
    max_tokens=4000,
    )

    return completion.choices[0].message.content


def TourPlan(question_ans)->str:
    print(question_ans)
    completion = client.chat.completions.create(
    model="gpt-3.5-turbo-16k",
    messages=[
        {"role": "system", "content": SYSTEMPROMPT},
        {"role": "user", "content": str(question_ans)+"\n Return all posible task that can be done in the given location in an array or list"},
    ],
    max_tokens=4000,
    )

    return completion.choices[0].message.content

if __name__ == "__main__":
    client = OpenAI(api_key="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")
    print(TourPlan("""
Where are you planning to go?
Ratnari
Any specific activity/movent in mind?
sunset view,magiee,snow fall
What is your budget?
30k inr    
How many people are going?
2 boys
What is the duration of your trip?
2 days
"""))