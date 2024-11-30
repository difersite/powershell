# Inicio de Oh-my-posh
# Incluye la definicion de Tema
# (@(& 'C:/Users/dferruzr/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\dferruzr\AppData\Local\Programs\oh-my-posh\themes\night-owl.omp.json' --print) -join "`n") | Invoke-Expression
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

# Carga de accesorios
# Terminal Icons
Import-Module Terminal-Icons

# ultimos comandos
Set-PSReadLineOption -PredictionViewStyle ListView

## funciones
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
	param(
	    [string]$name
	 )
	$qteName = $name + '.xlsx'
	if (-not $name) {
	    write-Host "No agregaste el nombre, favor agregar -name y el nombre sin extension"
	} else {
	    write-host "Generando el archivo"
	    # Ejecutar el proceso
	    Copy-Item 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\DTTQuoteV9.xlsx' .
	    Rename-Item DTTQuoteV9.xlsx $qteName
	    Start-Process $qteName
	}
}
function OpenPT {
	param(
	    [string]$name
	 )
	$PTName = $name + '.xlsm'
	echo $PTName
	if (-not $name) {
	    write-Host "No agregaste el nombre, favor agregar -name y el nombre sin extension"
	} else {
	    write-host "Generando el archivo"
	    # Ejecutar el proceso
	    Copy-Item 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\Deloitte - Pricing Tool Chile v4.2.8 FY25.xlsm ' .
	    Rename-Item 'Deloitte - Pricing Tool Chile v4.2.8 FY25.xlsm' $PTName
	    Start-Process $PTName
	}
}
function OpenCotizacion {
	param(
	    [string]$name
	 )
	$CotiName = $name + '.xlsx'
	if (-not $name) {
	     write-Host "No agregaste el nombre, favor agregar -name y el nombre sin extension"
	} else {
	    write-Host "Generando el Archivo"
	    Copy-Item 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\DTTCotizacionXLS.xlsx' .
	    Rename-Item DTTCotizacionXLS.xlsx $CotiName
	    Start-Process $CotiName
	}
}
function OpenPropuesta {
	param(
	    [string]$name
	 )
	$docName = $name + '.docx'
	if (-not $name) {
	     write-Host "No agregaste el nombre, favor agregar -name y el nombre sin extension"
	} else {
	    write-Host "Generando el Archivo"
	    Copy-Item 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\DTTTamplate04.docx' .
	    Rename-Item DTTTamplate04.docx $docName
	    Start-Process $docName
	}
}
function dirfile {
	## Para Ordenar 
	## por fecha:  | Sort-Object LastWriteTime -Descending
	## Por Nombre: | Sort-Object Name
	Get-ChildItem -File -Hidden:$false | Where-Object { $_.Name -notlike ".*" } | select LastWriteTime, Name -f 10
}
function dirAll {
	Get-ChildItem
}
function onlydir {
	Get-ChildItem -Directory | select Name
}
function openfm {
	explorer .
}
function backcd {
    Set-Location ..
}
function openlf {
    lfcd ## -last-dir-path $args | Set-Location
}
function opengend {
    Start-Process chrome https://gend.deloitte.ca
}
function viewpath {
	# Como editar el PATH
	# Busca "Variables de entorno" en el menú de inicio de Windows.
	# Haz clic en "Variables de entorno".
	# En "Variables del sistema", busca la variable Path y haz clic en "Editar".
	param(
	    [string]$name
	 )
	$fileName = "*" + $name + "*"
	if (-not $name) {
	     write-Host "Se Despliega todo el path:"
		 $env:Path -split ';'
	} else {
	    write-Host "Path de la aplicacion especifica " $fileName
	     $env:Path -split ';' | Where-Object { $_ -like $fileName }
	}
    
}

function reqCloude {

	# Definición de la variable de token
	$CAI_TOKEN="API Token de Calypso"

	# Función para enviar solicitud a la API
	function Send-CalypsoRequest {
		param(
			[string]$Prompt
		)

		# Configuración de los encabezados
		$headers = @{
			"Authorization" = "Bearer $CAI_TOKEN"
			"Content-Type" = "application/json"
		}

		# Crear el cuerpo de la solicitud con el prompt ingresado
		$body = @{
			"input" = $Prompt
		} | ConvertTo-Json

		# Realizar la solicitud POST
		try {
			$fullResponse = Invoke-RestMethod -Uri "https://www.us1.calypsoai.app/backend/v1/prompts" `
				-Method Post `
				-Headers $headers `
				-Body $body

			# Extraer solo la respuesta del campo result.response
			$extractedResponse = $fullResponse.result.response

			# Mostrar solo la respuesta
			Write-Host "Respuesta:" -ForegroundColor Green
			Write-Host $extractedResponse
		}
		catch {
			Write-Error "Error en la solicitud: $_"
		}
	}

	# Función principal para interacción del usuario
	function Main {
		while ($true) {
			# Solicitar el prompt al usuario
			Write-Host "Introduce tu pregunta para Calypso AI (o 'salir' para terminar)" -ForegroundColor blue
			$userPrompt = Read-Host
			
			# Opción para salir
			if ($userPrompt -eq 'salir') {
				break
			}

			# Enviar la solicitud con el prompt del usuario
			Send-CalypsoRequest -Prompt $userPrompt
		}
	}
		
	# Ejecutar la función principal
	Main

}
 
## Alias
## Atajos
## cd va a home /users/$user ~
Set-Alias gdoc Go2Document 	## Azul
Set-Alias gtmp Go2Temp 		## Gray
Set-Alias gprj Go2Project	## Blanco
Set-Alias gprd Go2Product	## Green
Set-Alias gtemp Go2Template	## Red

## Crear documentos
set-Alias oQte OpenQuote
set-Alias oDoc OpenPropuesta
set-Alias oPT OpenPT
set-Alias oCoti OpenCotizacion

## Listar informacion
set-Alias la dirAll
set-Alias ld onlydir
set-Alias ll dirfile
Set-Alias .. backcd 
Set-Alias path viewpath

## ejecutar programas
Set-Alias open openfm
Set-Alias fm openlf
Set-Alias gd opengend
Set-Alias claude reqCloude

############################################################################
## NOTAS
###########################################################################
# Get-Content: Get-Content -path \temp
# ForEach-Object
# Out-File
# Test-NetConnection
# ConvertTo-Json
# Get-Date
# Start-Sleep
# Write-Host
# Get-Command
# Get-Help
