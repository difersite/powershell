# Inicio de Oh-my-posh
# Incluye la definicion de Tema
(@(& 'C:/Users/dferruzr/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\dferruzr\AppData\Local\Programs\oh-my-posh\themes\night-owl.omp.json' --print) -join "`n") | Invoke-Expression

# Carga de accesorios
# Terminal Icons
Import-Module Terminal-Icons

# ultimos comandos
Set-PSReadLineOption -PredictionViewStyle ListView

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
	if (-not $name) {
	    write-Host "No agregaste el nombre, favor agregar -name y el nombre sin extension"
	} else {
	    write-host "Generando el archivo"
	    # Ejecutar el proceso
	    Copy-Item 'C:\Users\dferruzr\OneDrive - Deloitte (O365D)\Documents\A1-INTERNOS\TEMPLATE\Deloitte - Pricing Tool Chile v4.2.7 FY25.xlsm' .
	    Rename-Item 'Deloitte - Pricing Tool Chile v4.2.7 FY25.xlsm' $PTName
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

function dirAll {
	ls | select Name, LastAccessTime -f 10
}
function onlydir {
	ls -Directory
}
function openfm {
	explorer .
}
function backcd {
    Set-Location ..
}



Set-Alias gdoc Go2Document
Set-Alias gtmp Go2Temp
Set-Alias gprj Go2Project
Set-Alias gprd Go2Product
Set-Alias gtemp Go2Template
set-Alias oQte OpenQuote
set-Alias oDoc OpenPropuesta
set-Alias oPT OpenPT
set-Alias oCoti OpenCotizacion
set-Alias la dirAll
set-Alias ld onlydir
Set-Alias open openfm
Set-Alias .. backcd 
