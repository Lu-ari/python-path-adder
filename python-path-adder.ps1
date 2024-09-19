# Kullanıcı adını klavyeden al
$userName = Read-Host "Lütfen kullanıcı adınızı girin (YourUsername)"

# Python sürümünü tespit et
$pythonVersion = & python --version 2>&1
$pythonVersion = $pythonVersion -replace 'Python ', '' -replace '\s', ''

# Major ve minor sürüm numaralarını tespit et (örneğin: 3.12)
$pythonMajorMinor = $pythonVersion -replace '(\d+)\.(\d+)\.\d+', '$1$2'

# Python dizin yollarını ayarla
$pythonPath = "C:\Users\$userName\AppData\Local\Programs\Python\Python$pythonMajorMinor\"
$pythonScriptsPath = "C:\Users\$userName\AppData\Local\Programs\Python\Python$pythonMajorMinor\Scripts\"

# Python yolunu ve Scripts dizinini ortam değişkenlerine ekle
$existingPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if ($existingPath -notlike "*$pythonPath*" -and $existingPath -notlike "*$pythonScriptsPath*") {
    [Environment]::SetEnvironmentVariable("Path", $pythonPath + ";" + $pythonScriptsPath + ";" + $existingPath, [EnvironmentVariableTarget]::Machine)
    Write-Host "Python yolları başarıyla ortam değişkenlerine eklendi:"
    Write-Host $pythonPath
    Write-Host $pythonScriptsPath
} else {
    Write-Host "Python yolları zaten ortam değişkenlerinde mevcut."
}
