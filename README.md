# GPU Docker Application

This project is a simple Python application that utilizes GPU resources using Docker and NVIDIA's Docker toolkit. The application checks for GPU availability and performs basic tensor operations using PyTorch.



## Prerequisites

- **Docker**: Ensure you have Docker installed on your machine. You can follow the installation instructions on the [Docker website](https://docs.docker.com/get-docker/).
- **NVIDIA GPU**: You need an NVIDIA GPU with the appropriate drivers installed.
- **NVIDIA Docker**: Follow the instructions below to install NVIDIA Docker to enable GPU support in Docker containers.

## Installing NVIDIA Docker

1. **Add the NVIDIA Docker repository**:

   ```bash
   distribution="ubuntu22.04"  # Use this for Ubuntu 24.04 as well
   curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
   curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

    sudo apt-get update
    ```
2. **Install NVIDIA Docker**:
3. ```bash
   sudo apt-get install -y nvidia-docker2
   sudo systemctl restart docker
   ```
4. **Verify the installation**:
5. ```bash
   docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
   ```
6. If the installation was successful, you should see the NVIDIA SMI output in the terminal.
7. **Note**: If you encounter any issues, refer to the [NVIDIA Docker documentation](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker).
8. **Building the Docker image**:
9. Clone this repository and navigate to the project directory.
10. Build the Docker image using the following command:
11. ```bash
    docker build -t gpu-docker-app .
    ```
12. **Running the Docker container**:
13. Run the Docker container using the following command:
14. ```bash
    docker run --gpus all -it gpu-docker-app
    ```
15. If the container starts successfully, you should see the following output:
16. ```
    GPU is available
    Tensor([[1., 1.],
            [1., 1.]], device='cuda:0')
    ```
17. The output indicates that the GPU is available and that a tensor operation was performed using the GPU.
18. **Stopping the Docker container**:
19. To stop the Docker container, press `Ctrl+C` in the terminal.
20. **Summary**:
    21. This project demonstrates how to utilize GPU resources in a Docker container using NVIDIA's Docker toolkit. You can extend this project by adding more complex GPU-accelerated applications or libraries to the Docker container.