import json
import os

def query_cve(keyword):
    print(f"[*] FURY CVE: Querying intelligence database for '{keyword}'")
    
    db_path = os.path.join(os.path.dirname(__file__), "data/cve_db.json")
    
    if os.path.exists(db_path):
        with open(db_path, 'r') as f:
            data = json.load(f)
            print(f"[i] Last Sync: {data.get('last_updated')}")
            database = data.get('vulnerabilities', [])
    else:
        # Fallback to simulation
        database = [
            {"id": "CVE-2026-0001", "score": 9.8, "desc": "Critical RCE in Quantum-Bridge layer"},
            {"id": "CVE-2025-9999", "score": 7.5, "desc": "Auth Bypass in FURY-MESH (Legacy)"}
        ]
    
    for entry in database:
        if keyword.lower() in entry['desc'].lower() or keyword.lower() in entry['id'].lower():
            print(f"[+] MATCH: {entry['id']} | CVSS: {entry['score']} | {entry['desc']}")

if __name__ == "__main__":
    query_cve("RCE")
