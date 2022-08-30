FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8081
ENV ASPNETCORE_URLS=http://+:8081

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS bas3
WORKDIR /src
COPY ["new.csproj", "./"]
RUN dotnet restore "new.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "new.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "new.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet"]

