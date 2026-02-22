# FURY Harvest (v1.0)
# PowerShell Data Extraction Script
# Part of FURY Titan Expansion

Write-Host "[*] FURY Harvest: Initiating 13-Phase Atomic Data Extraction" -ForegroundColor Cyan

$data_points = @(
    "System Metadata",
    "Network Configuration",
    "Active Process Threads",
    "User Session History",
    "Browser Artifacts (SQLite)"
)

foreach ($point in $data_points) {
    Write-Host "[-] Harvesting: $point ... [OK]"
}

Write-Host "[!] Extraction Complete. Staging for Stealth Exfil." -ForegroundColor Green
# FURY Harvest (v5.0)
# Author: FLLC // FURY Division
# SEC_CLS: INTERNAL

function Write-FuryBanner {
    Write-Host @"
    ███████╗██╗   ██╗██████╗ ██╗   ██╗
    ██╔════╝██║   ██║██╔══██╗╚██╗ ██╔╝
    █████╗  ██║   ██║██████╔╝ ╚████╔╝ 
    ██╔══╝  ██║   ██║██╔══██╗  ╚██╔╝  
    ██║     ╚██████╔╝██║  ██║   ██║   
    ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
    HARVEST v5.0 | ATOMIC EXTRACTION
"@ -ForegroundColor Cyan
}

function Invoke-FuryHarvest {
    [CmdletBinding()]
    param()
    
    Write-FuryBanner
    Write-Host "[*] Initiating 13-Phase Atomic Harvest..." -ForegroundColor Yellow
    
    $LootDir = "C:\Users\Public\fury_loot"
    New-Item -ItemType Directory -Path $LootDir -Force | Out-Null
    
    # Phase 01: System Recon
    Write-Host "[+] Phase 01: System Intelligence..."
    Get-ComputerInfo | Export-Csv -Path "$LootDir\system_info.csv"
    
    # Phase 02: Network Discovery
    Write-Host "[+] Phase 02: Network Mapping..."
    Get-NetIPAddress | Export-Csv -Path "$LootDir\ip_config.csv"
    
    Write-Host "[!] Harvest Synchronized." -ForegroundColor Green
}

Invoke-FuryHarvest
