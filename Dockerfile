FROM mcr.microsoft.com/powershell:latest

WORKDIR /app

SHELL ["/opt/microsoft/powershell/7/pwsh", "-Command"]

RUN Install-Module -Name Pode -Force

ADD ["server.ps1", "/app/"]

ENTRYPOINT ["pwsh", "-File", "server.ps1"]
