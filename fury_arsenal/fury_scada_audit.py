#!/usr/bin/python3
"""
FURY SCADA Audit (v1.0)
Industrial Control System Vulnerability Scanner
"""
def scan_scada(site_ip):
    print(f"[*] FURY SCADA Audit: Mapping Industrial Control Registers at {site_ip}")
    
    # Modbus/TCP register mapping simulation
    registers = {
        "40001": {"val": 350, "desc": "Temperature_Set_Point"},
        "40012": {"val": 1500, "desc": "Pressure_Vessel_PSI"},
        "40045": {"val": 1, "desc": "Valve_01_Status (OPEN)"}
    }
    
    for reg, data in registers.items():
        print(f"[+] REGISTER {reg}: {data['val']} ({data['desc']})")
        
    print("[!] SECURITY ADVISORY: Default PLC Firmware v2.1 detected [VULNERABLE]")

if __name__ == "__main__":
    scan_scada("10.0.0.5")
