# Powershell
Instalacion de Windows Terminal
Actualizacion de Powershell, instalando desde MS Store Powerwhell

## Configuraciones en PowerShell (pwsh)
Foco en Aplicaciones
- Terminal
- Oh-my-poh
- lf
- nvim

### Terminal
Configuraciones base, en setup, en inicio. Perfil predeterminado: PowerShell y Aplicacion de Terminal: Terminal Windows.
Luego, en combinacion de colores, ir directamente a las definiciones del JSON y editar el archivo
Incluir snazzy https://github.com/Richienb/windows-terminal-snazzy/blob/main/snazzy.json
A mi me gusta on Half Dark que se selecciona en la combinacion de colores una vez guardadno la configuracion en el JSON
Luego para las pestañas, en el setting en apariencia activar usar materiales Acrilicos.
Ojo se supone que esta installado winget, desde MS Store
Luwgo Instalar Oh-my-posh
- oh-my-posh
Instalar con winget, siguiendo las instrucciones del sitio de oh-my-posh con sus temas:
https://ohmyposh.dev/
```
winget install JanDeDobbeleer.OhMyPosh -s winget
```
Antes de aplicar los cambios y ejecutar oh-my-posh agregamos las fuentes
**Instalacion de fuentes**
Este comando debe ser instalado como administrador
```
oh-my-posh font install
```
Y seleccionar la fuente, por ejemplo FiraCode
Luego se debe configurar, pero esto no como administrador por lo que se debe reiniciar e ir a setting/Perfil/Apariencia y en fuentes cambiar a firacode mono (mono es que cada caracter ocupa la misma distancia)
**Ejecutar Oh-my-Posh**
```
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"
```
esto arroja un comando que se debe ejecutar que incluye el tema que se puede editar segun gusto
```
(@(& 'C:/Users/dferruzr/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\dferruzr\AppData\Local\Programs\oh-my-posh\themes\jandedobbeleer.omp.json' --print) -join "`n") | Invoke-Expression
```
En este caso es jandedobbleer
```
Get-PoshThemes
```
Y seleccionar el tema, en mi caso night-owl (con control presionado sobre el nombre se abre la configuracion en VSCode)
```
(@(& 'C:/Users/dferruzr/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\dferruzr\AppData\Local\Programs\oh-my-posh\themes\night-owl.omp.json' --print) -join "`n") | Invoke-Expression
```
Todo esto debe ser incluido en $Profile, pero el archivo $profile.ps1 deber estar creado previamente para eso ejecutar
```
New-Item -Path $PROFILE -Type File -Force
```
Con esto esta creado $Profile y editamos con nvim o cualquier editor y ponemos la configuracion gruadada antes

- lf
- nvim

Configuraciones de pwsh
Alias en $PROFILE

**RUTAS**

**REFERENCIAS** /n
Agradecimientos a Nicolas {hola mundo} 
https://www.youtube.com/watch?v=6SGIFVJ5Izs&t=923s
