# Script de Instalação do Ubuntu no WSL

# Variáveis
$distroName = "Ubuntu-22.04"
$installPath = "V:\WSL\$distroName"
$imageUrl = "https://cloud-images.ubuntu.com/wsl/jammy/current/ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz"
$imageFile = "$env:TEMP\ubuntu-jammy-wsl.tar.gz"
$userName = "aragua"  # Substitua pelo nome de usuário desejado
$password = "shutdown"  # Substitua pela senha desejada

# Verificar se o WSL está habilitado
Write-Host "Verificando se o WSL está habilitado..."
if (-not (Get-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online).State -eq "Enabled") {
    Write-Host "Habilitando o WSL..."
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
    Write-Host "Por favor, reinicie o computador e execute o script novamente."
    exit
}

# Habilitar WSL2 como padrão (caso não esteja configurado)
Write-Host "Configurando WSL2 como padrão..."
wsl --set-default-version 2

# Criar diretório de instalação
Write-Host "Criando diretório de instalação em $installPath..."
if (-not (Test-Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force
}

# Baixar a imagem do Ubuntu
Write-Host "Baixando a imagem do Ubuntu 22.04 LTS..."
Invoke-WebRequest -Uri $imageUrl -OutFile $imageFile

# Importar a imagem para o WSL
Write-Host "Importando a imagem para o WSL..."
wsl --import $distroName $installPath $imageFile

# Definir a distribuição como padrão
Write-Host "Definindo $distroName como distribuição padrão..."
wsl --set-default $distroName

# Configurar usuário inicial
Write-Host "Configurando usuário inicial..."
wsl -d $distroName /bin/bash -c "useradd -m -s /bin/bash $userName && echo '$userName:$password' | chpasswd"

# Iniciar a distribuição
Write-Host "Iniciando $distroName..."
wsl -d $distroName

# Limpar arquivo temporário
Write-Host "Limpando arquivos temporários..."
Remove-Item $imageFile

Write-Host "Instalação concluída! Execute 'wsl -d $distroName' para acessar o Ubuntu."