$user_api_csv_update  = "https://backend.staffbase.com/api/users/import/csv/update"

$auth_token    = "NjE3MmVmMGMwNzFhMGExOWYzMDhlOGE5OnhBcGZUNi0kXnp9dSRkfilRaFBLazFrW0laRWwhLmY2JDhSekI3JiQhNUN9a0N4Y3RbXXpxe2o0TEduWWxqRnk="


$Headers_csv_update       = @{ 
	'Authorization' = "Basic $auth_token"
}

$contentType = 'application/x-www-form-urlencoded' 

$Body_csv_update = @{
    dry = "false"
    sendMailsNew    = "false"
    sendMailsPending= "false"
	mappings = "Email,externalID,profile-field:firstName,profile-field:lastName,profile-field:department,profile-field:location"
  }

Write-Host ("Adjust the csv Mapping")
Write-Host ($Body_csv_update |ConvertTo-Json)
#Step 2, need to update the column mapping of the CSV columns to the available Staffbase fields

try{
	#$response_csv_update = 
    Invoke-WebRequest -Uri ("$user_api_csv_update") -Contenttype $contentType -Headers $Headers_csv_update -Method 'POST' -Body $Body_csv_update

    #Write-Host($response_csv_update.COntent)
  } catch {
	Write-Host "An error occurred:"
	Write-Host $_
  }