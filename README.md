# linuxEverywh3re

This repository contains Dockerfiles for setting up **Debian**, **Ubuntu**, and **Kali** Docker containers with **SSH** and **VNC** access, along with the **XFCE desktop environment** and **cyber tools** on **Kali**. These containers are configured to allow remote access via SSH and VNC, with a default root password set to `toor`.

## 📸 Screenshot

![image](https://github.com/user-attachments/assets/0cc8d417-6de3-4117-807b-22a8561d461e)


## 🛠️ Prerequisites

- **Docker** installed on your machine.
  - Install Docker: [Docker Installation Guide](https://docs.docker.com/get-docker/)
  
## 🚀 Getting Started

You can either **build** the Docker images locally or **pull** them from the <a href="https://hub.docker.com/repositories/0adri3n" targer="_blank">Docker Hub</a>. Below are the steps for both options.

## 🐳 From Docker Hub

#### For Debian:
```bash
docker pull 0adri3n/debian-ssh-vnc:latest.
```

#### For Ubuntu:
```bash
docker pull 0adri3n/ubuntu-ssh-vnc:latest.
```

#### For Kali:
```bash
docker pull 0adri3n/kali-ssh-vnc:latest.
```

## 🔨 Build the images locally

### 1. **Clone this repository**
```bash
git clone https://github.com/0adri3n/linuxEverywh3re.git
cd linuxEverywh3re
```

### 2. **Build the Docker images** (Optional)
To build the images locally for **Debian**, **Ubuntu**, and **Kali**, use the following commands:

#### For Debian:
```bash
cd debian
docker build -t debian-ssh-vnc .
```

#### For Ubuntu:
```bash
cd ubuntu
docker build -t ubuntu-ssh-vnc .
```

#### For Kali:
```bash
cd kali
docker build -t kali-ssh-vnc .
```

### 3. **Run the Docker containers**

You can run the containers as follows:

#### For Debian:
```bash
docker run -d --name debian-container -p 2223:22 -p 5901:5900 debian-ssh-vnc
```

#### For Ubuntu:
```bash
docker run -d --name ubuntu-container -p 2224:22 -p 5902:5900 ubuntu-ssh-vnc
```

#### For Kali:
```bash
docker run -d --name kali-container -p 2225:22 -p 5903:5900 kali-ssh-vnc
```

### 4. **Access the Docker containers**

- **SSH Access**:  
  Use the following command to SSH into the container:
  ```bash
  ssh root@localhost -p <PORT>
  ```
  Replace `<PORT>` with `2223`, `2224`, or `2225` for **Debian**, **Ubuntu**, or **Kali**, respectively.

  Default password: `toor`

- **VNC Access**:  
  Connect using a VNC client (e.g., **TigerVNC**, **Remmina**, **RealVNC**) to the following address:
  - For **Debian**: `localhost:5901`
  - For **Ubuntu**: `localhost:5902`
  - For **Kali**: `localhost:5903`

  Default password: `toor`

---

## 🧑‍💻 Customization

You can modify the Dockerfiles or the `entrypoint.sh` script to further customize your container. The default VNC password is set to `toor`, but you can change it by modifying the respective Dockerfile and running `x11vnc -storepasswd`.

---

## ⚡ Additional Information

- **XFCE** is installed as the desktop environment. You can replace it with other desktop environments if needed (e.g., GNOME, LXDE).
- **Xvfb** is used to create a virtual display for VNC.
- **x11vnc** provides VNC access to the virtual display.

---

## 📝 License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

### ✨ Contributions
Feel free to open issues or submit pull requests if you have improvements, bug fixes, or additional features in mind!
