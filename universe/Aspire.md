---
tags:
  - dotnet
---
```
.NET Aspire is an opinionated, cloud ready stack for building observable, production ready, distributed applications. .NET Aspire is delivered through a collection of NuGet packages that handle specific cloud-native concerns.
```

https://learn.microsoft.com/en-us/dotnet/aspire/get-started/build-your-first-aspire-app?tabs=visual-studio
In the blog it says that it is installable from VS Installer but mine does not have, and so my colleague as well. Also if dotnet 8 is installed from VS Installer, they had problems installing trough dotnet cli as well. 
It mostly helps for development environment. NOT PRODUCTION.
`.ServiceDefaults` is for implementing **OpenTelemetry** configuration. Each service should import it 
```
builder.AddServiceDefaults();
app.MapDefaultEndpoints();
```

To run all microservices. you start only `.AppHost` project. It manages to run others by himself. 

Service discovery is a huge **lie** in your face.  It is not auto. You manually bind them in .AppHost but it's better than nothing

Scenario 1: You have a web and api services.

Aspire helps you connect these services so you don't configure url/port etc on web service.

How: on Apphost.Program.cs you give {name} to your api service and in the web project you can do this 

```C#
builder.Services.AddHttpClient<WeatherApiClient>(client => client.BaseAddress = new("http://{name}"));
```