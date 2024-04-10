FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS build
WORKDIR /work
COPY . /work
RUN dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
EXPOSE 80
LABEL version="1.0"
WORKDIR /apps
COPY --from=build /work/WebApplication_DIT_Docker/bin/Debug/net6.0/* /apps/
RUN set -eux \
  && useradd -u 9000 nonroot \
  && chown -R 9000:9000 /apps/*
USER 9000:9000
ENTRYPOINT ["dotnet", "WebApplication_DIT_Docker.dll"]
