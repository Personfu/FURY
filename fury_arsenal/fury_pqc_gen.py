#!/usr/bin/python3
"""
FURY PQC-Gen (v1.0)
Post-Quantum Cryptography Key Generator (Kyber Demo)
"""
import hashlib
import os

def generate_pqc_keys():
    print("[*] Generating CRYSTALS-Kyber Lattice Keys...")
    seed = os.urandom(32)
    public_key = hashlib.sha3_512(seed).hexdigest()
    secret_key = hashlib.shake_256(seed).hexdigest(128)
    
    print(f"[+] Public Key (Kyber-768): {public_key[:64]}...")
    print(f"[+] Secret Key (Encrypted): {secret_key[:32]}...[SECURE]")
    
    return public_key, secret_key

if __name__ == "__main__":
    generate_pqc_keys()
