
$user_api_url = "https://backend.staffbase.com/api/users/"

$auth_token    = "NjE3MmVmMGMwNzFhMGExOWYzMDhlOGE5OnhBcGZUNi0kXnp9dSRkfilRaFBLazFrW0laRWwhLmY2JDhSekI3JiQhNUN9a0N4Y3RbXXpxe2o0TEduWWxqRnk="
$Headers      = @{ 'Authorization' = "Basic $auth_token" }

$avatar_path   = "$PSScriptRoot\Avatars\"


$avatars_to_path = (Get-ChildItem $avatar_path -Recurse).fullname

# Please use Powershell 7.1
foreach ($file in $avatars_to_path){

$file_to_id = (Get-ChildItem $file -Recurse).BaseName

$form_media_avatar = @{
  avatar= Get-Item -Path "$file"
}
 
# PUT // Upload Avatar to the matching Profile
Write-Host ("Uploading Avatar for User with ID $file")
try{ 
  $response_avatar_upload = Invoke-WebRequest -Uri ($user_api_url + $file_to_id) -Headers $Headers -Method 'put' -Form $form_media_avatar
} catch {
  Write-Host "An error occurred:"
  Write-Host $_
}

}








