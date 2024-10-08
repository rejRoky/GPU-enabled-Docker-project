# app.py
import torch

def check_gpu():
    if torch.cuda.is_available():
        print(f"GPU is available: {torch.cuda.get_device_name(0)}")
    else:
        print("GPU is not available.")

if __name__ == "__main__":
    check_gpu()
    # Simple tensor operation
    x = torch.rand(5, 3)
    print("Random tensor:\n", x)
