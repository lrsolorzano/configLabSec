# Windows Server Configuration Script

# This script performs basic configuration for a Windows Server.

# Update the system
Write-Host "Updating the system..."
Start-Process -FilePath "powershell.exe" -ArgumentList "-Command Invoke-WebRequest -Uri https://aka.ms/win10 -OutFile C:\temp\WindowsUpdate.ps1; & C:\temp\WindowsUpdate.ps1" -Wait -NoNewWindow

# Configure Windows Firewall
Write-Host "Configuring Windows Firewall..."
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

# Install important features
Write-Host "Installing necessary features..."
Install-WindowsFeature -Name Web-Server, AD-Domain-Services -IncludeManagementTools

# General cleanup
Write-Host "Cleaning up temporary files..."
Remove-Item -Path C:\temp\* -Recurse -Force

Write-Host "Windows Server configuration completed!"