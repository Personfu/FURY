#!/usr/bin/python3
"""
FURY MeshNode (v1.0)
Decentralized LoRa Mesh Simulator
"""
import random

def join_mesh(node_id):
    print(f"[*] FURY MeshNode: Connecting as {node_id}...")
    
    # Simulation of LoRa ad-hoc mesh discovery
    potential_peers = ["Fury_01", "Titan_Lead", "Ghost_Node", "Alpha_Base"]
    active_peers = random.sample(potential_peers, k=random.randint(2, 4))
    
    print(f"[+] Synchronized with {len(active_peers)} peers over FURY-MESH (868MHz)")
    for peer in active_peers:
        snr = random.randint(-15, 10)
        dist = random.randint(100, 1500)
        print(f"    - Link established: {peer} | SNR: {snr}dB | Est. Distance: {dist}m")
    
    print(f"[+] Multi-hop routing table updated.")

if __name__ == "__main__":
    join_mesh("FURY_LAB_PROTOTYPE")
