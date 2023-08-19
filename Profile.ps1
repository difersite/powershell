NOMBRE: Microsoft.PowerShell_profile.ps1
RUTA: C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
Detalle:
# Iniciar oh-my-posh
# Mostrar Iconos
oh-my-posh init pwsh | Invoke-Expression
Import-Module -Name Terminal-Icons

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

## Alias
function Go2Document {
	Set-Location 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\'
}

function Go2Temp {
	Set-Location 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\Z9-TEMP\'
}

function Go2Project {
	Set-Location 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\M1-Proyectos\'
}

function Go2Product {
	Set-Location 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\F1-PRODUCTOS\'
}

function Go2Template {
	Set-Location 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\'
}

function OpenQuote {
	Start-Process 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\DTTQuoteV8.xlsx'
}
function OpenPropuesta {
	Start-Process 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\DTTTamplate03.docx'
}
function dirAll {
	ls | select Name, LastAccessTime -f 10
}
function onlydir {
	ls -Directory
}
function openfm {
	explorer .
}

Set-Alias gdoc Go2Document
Set-Alias gtmp Go2Temp
Set-Alias gprj Go2Project
Set-Alias gprd Go2Product
Set-Alias gtemp Go2Template
set-Alias oQte OpenQuote
set-Alias oDoc OpenPropuesta
set-Alias la dirAll
set-Alias ld onlydir
Set-Alias open openfm

## Inicio de ChatGPT

$script:OpenAI_Key = "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"

function Start-ChatGPT {
    $key = $script:openai_key
    $url = "https://api.openai.com/v1/chat/completions"

    $body = [pscustomobject]@{
        "model"    = "gpt-3.5-turbo"
        "messages" = @(
            @{"role" = "system"; "content" = "You are an assistant" }
        )
    }
    $header = @{
        "Authorization" = "Bearer $key"
        "Content-Type"  = "application/json"
    }
    while ($true) {
        $message = Read-Host "Prompt"
        $body.messages+=@{"role"="user";"content"=$message}
        $bodyJSON = ($body | ConvertTo-Json -Compress)
        try {
            $res = Invoke-WebRequest -Headers $header -Body $bodyJSON -Uri $url -method post
            $output = ($res.content | convertfrom-json).choices.message
            Write-Host ""
            write-host $output.content -ForegroundColor Green
            Write-Host "--------------"
            $body.messages+=$output
        }
        catch {
            Write-Error $error[-1]
            return $res
        }
    }
}
