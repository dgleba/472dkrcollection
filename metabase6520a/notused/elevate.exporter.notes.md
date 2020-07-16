# Status, I could not get this to work.

See elevate issues on github

# Elevate tools metabase exporter.

---

https://hub.docker.com/r/elevate/elevate.metabase.tools

docker pull elevate/elevate.metabase.tools

https://github.com/elevate/elevate.metabase.tools/issues/9

```
cd /srv/dkr/metabase6152
docker run --rm \
  -v $PWD:/data \
  -v $PWD/appsettings-pd8.json:/app/appsettings.json \
  elevate/elevate.metabase.tools \
  Command=export OutputFilename=/data/elevate-export-pd8.json

```

```
cd /srv/dkr/metabase6152
docker run --rm \
  -v $PWD:/data \
  -v $PWD/appsettings-pd3.json:/app/appsettings.json \
  elevate/elevate.metabase.tools \
  Command=export OutputFilename=/data/elevate-export-pd3.json

```

example..

```
docker run --rm \
  -v $PWD:/data \
  -v $PWD/appsettings.json:/app/appsettings.json \
  elevate/elevate.metabase.tools \
  Command=export OutputFilename=/data/metabase-state.json
```

Regardless of the operation, the Metabase API settings must be configured. E.g. in appsettings.json:

```
{
  "MetabaseApi": {
    "Url": "https://metabase-local.elevatedirect.com:32443",
    "Username": "mauricio@elevatedirect.com",
    "Password":  "123456789"
  }
}
```

---

albe@pmdsdata8:~$ cd /srv/dkr/metabase6152
albe@pmdsdata8:/srv/dkr/metabase6152$ docker run --rm \

> -v $PWD:/data \
>   -v $PWD/appsettings-pd8.json:/app/appsettings.json \
>  elevate/elevate.metabase.tools \
>  Command=export OutputFilename=/data/elevate-export-pd8.json

```
Unhandled Exception: Newtonsoft.Json.JsonReaderException: Could not convert string to integer: root. Path '[0].id', line 1, position 36.
at Newtonsoft.Json.JsonReader.ReadInt32String(String s)
at Newtonsoft.Json.JsonTextReader.FinishReadQuotedNumber(ReadType readType)
at Newtonsoft.Json.JsonTextReader.ReadAsInt32()
at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateList(IList list, JsonReader reader, JsonArrayContract contract, JsonProperty containerProperty, String id)
at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
at metabase_exporter.MetabaseApi.GetAllCollections() in /sln/metabase-exporter/MetabaseApi.cs:line 176
at metabase_exporter.MetabaseApiExport.GetMappedCollections(MetabaseApi api) in /sln/metabase-exporter/MetabaseApiExport.cs:line 88
at metabase_exporter.MetabaseApiExport.Export(MetabaseApi api) in /sln/metabase-exporter/MetabaseApiExport.cs:line 13
at metabase_exporter.Program.Export(MetabaseApi api, Export export) in /sln/metabase-exporter/Program.cs:line 32
at metabase_exporter.Program.Main(String[] args) in /sln/metabase-exporter/Program.cs:line 27
at metabase_exporter.Program.<Main>(String[] args)
albe@pmdsdata8:/srv/dkr/metabase6152\$
```

---

curl -X GET \
 -H "Content-Type: application/json" \
 -H "X-Metabase-Session: 38f4939c-ad7f-4cbe-ae54-30946daf8593" \
 http://pmdsdata8:6152/api/user/current

#

curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder9"}' \
 http://pmdsdata8:6152/api/session

curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder98"}' \
 http://pmdsdata8:6151/api/session

curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder9"}' \
 http://pmdsdata.stackpole.ca:2012/api/session

---

albe@pmdsdata8:/srv/dkr/metabase6152\$ curl -X POST \

> -H "Content-Type: application/json" \
> -d '{"username": "dgleba@stackpole.com", "password": "powder9"}' \
> http://pmdsdata.stackpole.ca:2012/api/session
> {"id":"6798ab9c-f598-46cf-947a-4772ed7d38b1"}albe@pmdsdata8:/srv/dkr/metabase6152\$

# first metabase

cleaned..
albe@pmdsdata8:/srv/dkr/metabase6152\$ curl -X POST \

> -H "Content-Type: application/json" \
>  -d '{"username": "dgleba@stackpole.com", "password": "x"}' \
>  http://pmdsdata.stackpole.ca:2012/api/session
> {"id":"x798ab9c-f598-46cg-947a-4772ed7d38bx"}

```
curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder9"}' \
 http://pmdsdata.stackpole.ca:2012/api/session

```

```
cd /srv/dkr/metabase6152
docker run --rm \
  -v $PWD:/data \
  -v $PWD/appsettings-pd3.json:/app/appsettings.json \
  elevate/elevate.metabase.tools \
  Command=export OutputFilename=/data/elevate-export-pd3.json

```

```
{
  "MetabaseApi": {
    "Url": "http://pmdsdata.stackpole.ca:2012",
    "Username": "dgleba@stackpole.com",
    "Password": "x"
  }
}
```

```
albe@pmdsdata8:/srv/dkr/metabase6152$ docker run --rm   -v $PWD:/data   -v $PWD/appsettings-pd3.json:/app/appsettings.json   elevate/elevate.metabase.tools   Command=export OutputFilename=/data/elevate-export-pd3.json

Unhandled Exception: Newtonsoft.Json.JsonSerializationException: Error converting value {null} to type 'System.Int32'. Path '[5].database_id', line 1, position 13569. ---> System.InvalidCastException: Null object cannot be converted to a value type.
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)
   --- End of inner exception stack trace ---
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.SetPropertyValue(JsonProperty property, JsonConverter propertyConverter, JsonContainerContract containerContract, JsonProperty containerProperty, JsonReader reader, Object target)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateList(IList list, JsonReader reader, JsonArrayContract contract, JsonProperty containerProperty, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at metabase_exporter.MetabaseApi.GetAllCards() in /sln/metabase-exporter/MetabaseApi.cs:line 169
   at metabase_exporter.MetabaseApiExport.GetMappedCards(MetabaseApi api, IReadOnlyDictionary`2 collectionMapping) in /sln/metabase-exporter/MetabaseApiExport.cs:line 62
   at metabase_exporter.MetabaseApiExport.Export(MetabaseApi api) in /sln/metabase-exporter/MetabaseApiExport.cs:line 14
   at metabase_exporter.Program.Export(MetabaseApi api, Export export) in /sln/metabase-exporter/Program.cs:line 32
   at metabase_exporter.Program.Main(String[] args) in /sln/metabase-exporter/Program.cs:line 27
   at metabase_exporter.Program.<Main>(String[] args)
albe@pmdsdata8:/srv/dkr/metabase6152$

```

---

# 6151

```
cd /srv/dkr/metabase6152
docker run --rm \
  -v $PWD:/data \
  -v $PWD/appsettings-pd8-6151.json:/app/appsettings.json \
  elevate/elevate.metabase.tools \
  Command=export OutputFilename=/data/elevate-export-pd8-6151.json

result: resource temporarily unava..
```

```
curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder98"}' \
 http://pmdsdata8:6151/api/session

```

```
curl -X POST \
 -H "Content-Type: application/json" \
 -d '{"username": "dgleba@stackpole.com", "password": "powder98"}' \
 http://10.4.1.231:6151/api/session

```

```

albe@pmdsdata8:/srv/dkr/metabase6152$ docker run --rm \
>   -v $PWD:/data \
>   -v $PWD/appsettings-pd8-6151.json:/app/appsettings.json \
>   elevate/elevate.metabase.tools \
>   Command=export OutputFilename=/data/elevate-export-pd8-6151.json

Unhandled Exception: System.Exception: Error initialising Metabase API for http://pmdsdata8:6151/ ---> System.Net.Http.HttpRequestException: Resource temporarily unavailable ---> System.Net.Sockets.SocketException: Resource temporarily unavailable
   at System.Net.Http.ConnectHelper.ConnectAsync(String host, Int32 port, CancellationToken cancellationToken)
   --- End of inner exception stack trace ---
   at System.Net.Http.ConnectHelper.ConnectAsync(String host, Int32 port, CancellationToken cancellationToken)
   at System.Threading.Tasks.ValueTask`1.get_Result()
   at System.Net.Http.HttpConnectionPool.CreateConnectionAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Threading.Tasks.ValueTask`1.get_Result()
   at System.Net.Http.HttpConnectionPool.WaitForCreatedConnectionAsync(ValueTask`1 creationTask)
   at System.Threading.Tasks.ValueTask`1.get_Result()
   at System.Net.Http.HttpConnectionPool.SendWithRetryAsync(HttpRequestMessage request, Boolean doRequestAuth, CancellationToken cancellationToken)
   at System.Net.Http.RedirectHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Net.Http.HttpClient.FinishSendAsyncBuffered(Task`1 sendTask, HttpRequestMessage request, CancellationTokenSource cts, Boolean disposeCts)
   at metabase_exporter.MetabaseSessionTokenManager.GetNewSessionToken() in /sln/metabase-exporter/MetabaseSessionTokenManager.cs:line 105
   at metabase_exporter.MetabaseSessionTokenManager.<InvalidateSessionToken>b__7_0() in /sln/metabase-exporter/MetabaseSessionTokenManager.cs:line 92
   at metabase_exporter.MetabaseSessionTokenManager.SendWithSessionToken(HttpRequestMessage request) in /sln/metabase-exporter/MetabaseSessionTokenManager.cs:line 67
   at metabase_exporter.MetabaseSessionTokenManager.Send(Func`1 request) in /sln/metabase-exporter/MetabaseSessionTokenManager.cs:line 48
   at metabase_exporter.MetabaseApi.GetAllDashboards() in /sln/metabase-exporter/MetabaseApi.cs:line 182
   at metabase_exporter.Program.InitApi(MetabaseApiSettings apiSettings) in /sln/metabase-exporter/Program.cs:line 169
   --- End of inner exception stack trace ---
   at metabase_exporter.Program.InitApi(MetabaseApiSettings apiSettings) in /sln/metabase-exporter/Program.cs:line 177
   at metabase_exporter.Program.Main(String[] args) in /sln/metabase-exporter/Program.cs:line 26
   at metabase_exporter.Program.<Main>(String[] args)

albe@pmdsdata8:/srv/dkr/metabase6152$ curl -X POST \
>  -H "Content-Type: application/json" \
>  -d '{"username": "dgleba@stackpole.com", "password": "x"}' \
>  http://pmdsdata8:6151/api/session
{"id":"edited...878a5c-8bc2-480c-9f2f-aacf3ebex0a1"}albe@pmdsdata8:/srv/dkr/metabase6152$
```
