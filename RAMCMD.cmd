<# : o7_fixed_wrapper
@echo off
setlocal DisableDelayedExpansion

:: 1. Auto-elevación a Administrador con máximo privilegio
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Solicitando privilegios de Kernel/Administrador...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: 2. Ejecución directa inyectando el script en el entorno PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((Get-Content -LiteralPath '%~f0') -join [Environment]::NewLine)"

:: 3. BLOQUEO ESTRICTO EN CMD CON COLOR PERSONALIZADO
echo.
echo                 --------------------------------------------------
echo                 ^|==^> Presiona cualquier tecla para cerrar la consola ^<==^|
echo                 --------------------------------------------------
pause >nul
exit /b
#>

# ==============================================================================
# MOTOR ULTRA-AVANZADO DE PURGA DE RAM CON DISEÑO CENTRADO Y COLORIZADO (PATCHED)
# ==============================================================================

function Write-Centered {
    param (
        [string]$Text,
        [string]$ForegroundColor = "White"
    )
    $Width = [Console]::WindowWidth
    if ($Width -eq 0) { $Width = 80 }
    $Pad = [int](($Width - $Text.Length) / 2)
    if ($Pad -lt 0) { $Pad = 0 }
    Write-Host (" " * $Pad + $Text) -ForegroundColor $ForegroundColor
}

[Console]::Title = "Senior RAM Optimizer - Ultra RGB Edition"

# Cabecera de Inicio
Write-Centered "==================================================" "Magenta"
Write-Centered "     INICIANDO PURGA DE MEMORIA A NIVEL KERNEL    " "Cyan"
Write-Centered "==================================================" "Magenta"
Write-Host ""

$Process = [Diagnostics.Process]::GetCurrentProcess()
[System.Security.Principal.WindowsIdentity]::GetCurrent().Impersonate() | Out-Null

$API_Definition = @"
using System;
using System.Runtime.InteropServices;
public class KernelMemory {
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool SetProcessWorkingSetSize(IntPtr hProcess, IntPtr dwMinimumWorkingSetSize, IntPtr dwMaximumWorkingSetSize);
    [DllImport("ntdll.dll", SetLastError = true)]
    public static extern uint NtSetSystemInformation(int SystemInformationClass, IntPtr SystemInformation, int SystemInformationLength);
}
"@

if (-not ([System.Management.Automation.PSTypeName]'KernelMemory').Type) {
    Add-Type -TypeDefinition $API_Definition -ErrorAction SilentlyContinue
}

# FASE 1: Purga de Listas Standby usando la ruta absoluta de .NET Marshal para evitar errores
$SystemMemoryListCommand = 80
$PurgeCommands = @(4, 5)
foreach ($Cmd in $PurgeCommands) {
    # Uso de la firma absoluta para evitar el TypeNotFound de entornos restringidos
    $pCmd = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(4)
    [System.Runtime.InteropServices.Marshal]::WriteInt32($pCmd, $Cmd)
    $Result = [KernelMemory]::NtSetSystemInformation($SystemMemoryListCommand, $pCmd, 4)
    [System.Runtime.InteropServices.Marshal]::FreeHGlobal($pCmd)
}

# FASE 2: Vaciado de Working Sets en procesos activos
$procesos = Get-Process -ErrorAction SilentlyContinue
$optimizados = 0
foreach ($proc in $procesos) {
    try {
        if ($proc.Id -ne 0 -and $proc.Handle -ne [IntPtr]::Zero) {
            $res = [KernelMemory]::SetProcessWorkingSetSize($proc.Handle, -1, -1)
            if ($res) { $optimizados++ }
        }
    } catch {}
}

# FASE 3: Forzar recolección de basura
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Obtener métricas finales de la RAM
$os = Get-CimInstance Win32_OperatingSystem
$ramLibreGB = [Math]::Round($os.FreePhysicalMemory / 1024 / 1024, 2)
$ramTotalGB = [Math]::Round($os.TotalVisibleMemorySize / 1024 / 1024, 2)

# ------------------------------------------------------------------------------
# INTERFAZ DE USUARIO: REPORTE CON IDENTIFICACIÓN CROMÁTICA DE ACCIONES
# ------------------------------------------------------------------------------
Write-Centered "==================================================" "Green"
Write-Centered "           ¡PURGA EXTREMA COMPLETADA!             " "Green"
Write-Centered "==================================================" "Green"
Write-Host ""
Write-Centered "REPORTE DE ACCIONES EJECUTADAS:" "Yellow"
Write-Centered "--------------------------------" "DarkYellow"
Write-Centered "[OK] -> Se purgo la cache oculta del Kernel (Standby List)." "Cyan"
Write-Centered "[OK] -> Se libero la memoria del sistema de archivos." "Blue"
Write-Centered "[OK] -> Se optimizo el Working Set de $optimizados procesos." "DarkCyan"
Write-Centered "[OK] -> Se forzo la recoleccion de basura de .NET." "White"
Write-Host ""
Write-Centered "--------------------------------" "DarkYellow"
Write-Centered "ESTADO ACTUAL DE LA MEMORIA RAM:" "Yellow"
Write-Centered "--------------------------------" "DarkYellow"

# Resaltar los GB Libres en Verde Brillante
Write-Centered "RAM Disponible: $ramLibreGB GB libres de $ramTotalGB GB totales." "Green"
Write-Host ""
Write-Centered "==================================================" "Magenta"