import requests
import json

headers = {"Authorization": ""} # token push前请更改

#如果get()方法里没有headers参数，则会返回如下结果：（表示要求认证）

# {u'documentation_url': u'https://developer.github.com/v3', u'message': u'Requires authentication'}

# 但并不是所有的方法都必须要带上headers参数

# 获取个人信息（将kylinlin替换为任意的帐户名都可以）

response = requests.get("https://api.github.com/repos/CaptainXX/Bl4ckFOodMap/commits", headers=headers)
r = response.json()

if response.status_code == 200:
    log = {}   
    for i in range(0, 5):
        log[i] = {}
        log[i]["commit"] = r[i]["sha"]
        log[i]["author"] = r[i]["commit"]["author"]["name"]
        log[i]["date"] = r[i]["commit"]["author"]["date"]
        log[i]["message"] = r[i]["commit"]["message"]
        print(i)
        print("sha:", r[i]["sha"])
        print("author:", r[i]["commit"]["author"]["name"])
        print("date:", r[i]["commit"]["author"]["date"])
        print("message:", r[i]["commit"]["message"])
    print(json.dumps(log, ensure_ascii=False))
    with open("../response.json", "w", encoding='utf-8') as j:
        j.write(json.dumps(log, ensure_ascii=False, indent=4))
    print("文件写入完成")
else:
    print(response.status_code)
