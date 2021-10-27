
$user_api_csv_upload  = "https://backend.staffbase.com/api/users/import/csv/upload"

$user_api_csv_update  = "https://backend.staffbase.com/api/users/import/csv/update"

$auth_token    = "NjE3MmVmMGMwNzFhMGExOWYzMDhlOGE5OnhBcGZUNi0kXnp9dSRkfilRaFBLazFrW0laRWwhLmY2JDhSekI3JiQhNUN9a0N4Y3RbXXpxe2o0TEduWWxqRnk="

$csv_file	   = "$PSScriptRoot\email-password-recovery-code_edited.csv"


#$contentType = 'application/json;charset=utf-8' 

$Headers_csv_upload = @{ 
	'Authorization' = "Basic $auth_token"
}

$form_csv_upload = @{
	csv= Get-Item -Path "$csv_file"
	encoding = "UTF-8"
    fieldSeparator= ";"
  }

$FileContent = [IO.File]::ReadAllText($csv_file);
$csv_upload_body = @{
	csv="$FileContent"
	encoding = "UTF-8"
    fieldSeparator= ";"
  }

#Step 1, just upload the csv 

Write-Host ("Uploading csv $csv_file")
try{ 
  Invoke-WebRequest -Uri ($user_api_csv_upload) -ContentType 'multipart/form-data' -Headers $Headers_csv_upload -Method 'POST' -Form $csv_upload_body
  
  
  #Invoke-WebRequest -Uri ($user_api_csv_upload) -Headers $Headers_csv_upload -Method 'POST' -Form $form
  #Write-Host($response_csv_upload.COntent)
} catch {
  Write-Host "An error occurred:"
  Write-Host $_
}
