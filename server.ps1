Start-PodeServer -ScriptBlock {
  Add-PodeEndpoint -Address 0.0.0.0 -Port 34002 -Protocol Http

  New-PodeLoggingMethod -File -Path podelog -Name filelogger | Enable-PodeRequestLogging

  Add-PodeRoute -Method Get -Path / -ScriptBlock {
    # Generate a random page background color as hex values
    $Values = 1..6 | ForEach-Object -Process { 
      '{0:x}' -f (Get-Random -Minimum 0 -Maximum 15)
    }
    $BackgroundColor = [string]::Join('', $Values)
    $ResultString = '<html><body style="background-color: #{0}"><h1>Welcome to PowerShell Pode</h1><p>My runspace ID is {1}</p></body></html>' -f $BackgroundColor, $Host.Runspace.InstanceId.Guid
    Write-PodeHtmlResponse -Value $ResultString
  }
}