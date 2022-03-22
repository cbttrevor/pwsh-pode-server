FROM mcr.microsoft.com/powershell:latest

WORKDIR /app

SHELL ["pwsh", "-Command"]

RUN Install-Module -Name Pode -Force

ADD ["server.ps1", "/app/"]

ENTRYPOINT ["pwsh", "-File", "server.ps1"]