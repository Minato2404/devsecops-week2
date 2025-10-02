import subprocess

def add(a, b):
    return a + b

def divide(a, b):
    if b == 0:
        raise ValueError("Tidak boleh bagi nol")
    return a / b

def run_command(cmd):
    # Perbaikan: hapus shell=True agar aman
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout