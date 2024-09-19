
# Oturum açmış gerçek kullanıcının adını almak için fonksiyon
function Get-LoggedOnUser {
    $userName = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName)
    # Sadece kullanıcı adını almak için domain ya da makine adını ayır
    return $userName.Split('\')[-1]
}

# Oturum açmış gerçek kullanıcının adını al
$RealUsername = Get-LoggedOnUser

# Python sürümünü tespit et
$pythonVersion = & python --version 2>&1
$pythonVersion = $pythonVersion -replace 'Python ', '' -replace '\s', ''

# Major ve minor sürüm numaralarını tespit et (örneğin: 3.12)
$pythonMajorMinor = $pythonVersion -replace '(\d+)\.(\d+)\.\d+', '$1$2'

# Python dizin yollarını ayarla
$pythonPath = "C:\Users\$RealUsername\AppData\Local\Programs\Python\Python$pythonMajorMinor\"
$pythonScriptsPath = "C:\Users\$RealUsername\AppData\Local\Programs\Python\Python$pythonMajorMinor\Scripts\"

# Sistem Path ortam değişkenini al (System variables)
$existingPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

# Python yolları mevcut değilse sistem Path'e ekle
if ($existingPath -notlike "*$pythonPath*" -and $existingPath -notlike "*$pythonScriptsPath*") {
    $newPath = "$pythonPath;$pythonScriptsPath;$existingPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
    Write-Host "Python yolları başarıyla sistem Path'ine eklendi:"
    Write-Host $pythonPath
    Write-Host $pythonScriptsPath
} else {
    Write-Host "Python yolları zaten sistem Path'inde mevcut."
}
