# Use a Windows Server Core image
FROM --platform=windows mcr.microsoft.com/windows/servercore:ltsc2019

# Set up the Gitpod user
RUN net user gitpod /add && \
    net localgroup administrators gitpod /add

# Switch to the Gitpod user
USER gitpod
WORKDIR C:\Users\gitpod

# Install necessary tools or applications (using Chocolatey as an example)
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) && \
    choco install -y git

# Customize the environment if needed

# Entrypoint
CMD ["powershell"]
