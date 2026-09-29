<p align="center">
  <img src="docs/assets/cv-deployment-cover.png" alt="CV Deployment Handbook — camera capture, edge inference, and service deployment" width="100%">
</p>

<h1 align="center">CV Deployment Handbook</h1>

<p align="center">Field notes on bringing computer vision applications into operation.</p>

<p align="center">
  <a href="README.md">中文 · Full index</a> ·
  <a href="#start-here">Start here</a> ·
  <a href="https://github.com/LMIXR/helpfile/issues">Issues</a>
</p>

---

Practical notes on the engineering around computer vision: GPU environments, inference dependencies, Qt / C++ integration, camera streams, containers, and supporting services. Topics cover Ubuntu workstations and Jetson devices, with additional Windows and macOS notes.

Most documents are written in Chinese. These notes describe specific environments; check the versions and paths in each document before applying the steps.

## Start here

| Task | Reading |
| --- | --- |
| Set up a GPU machine | [Ubuntu](ubuntu/系统.md) → [GPU environment](ubuntu/显卡环境.md) → [CUDA](ubuntu/cuda.md) |
| Deploy on Jetson | [Nano](ubuntu/JetsonNano.md) / [Xavier NX](ubuntu/JetsonXavierNX.md) → [Qt on Jetson](qt/jetson/qt.md) |
| Build vision and inference dependencies | [OpenCV](qt/ubuntu/opencv.md) · [PyTorch](python/pytorch.md) · [tkDNN](tkdnn/ubuntu.md) |
| Connect cameras and video streams | [FFmpeg](qt/ubuntu/ffmpeg.md) · [GStreamer RTSP](qt/ubuntu/gst-rtsp-server.md) · [GB28181](流媒体/GB28181.md) |
| Package and deploy an application | [Qt packaging](qt/ubuntu/打包/打包.md) · [Executable deployment](qt/ubuntu/打包/可执行文件.md) · [Docker](docker/docker.md) |

## Browse by topic

- **Systems and edge devices** — [Ubuntu](ubuntu/), [Windows services](windows/服务.md)
- **Vision and inference** — [OpenCV for Python](python/opencv.md), [Paddle](paddle/ubuntu.md), [tkDNN](tkdnn/ubuntu.md)
- **Video and cameras** — [FFmpeg](qt/ubuntu/ffmpeg.md), [ONVIF](qt/ubuntu/onvif.md), [GB28181 / WVP / ZLMediaKit](流媒体/GB28181.md)
- **Qt and C++** — [Ubuntu](qt/ubuntu/), [Windows](qt/windows/), [macOS](qt/macos/), [Jetson](qt/jetson/)
- **Data and messaging** — [MySQL](mysql/), [MongoDB](mongo/), [Redis](redis/), [MinIO](minio/), [Kafka](kafka/)
- **Deployment and operations** — [Docker](docker/), [Jenkins](jenkins/), [Ansible](ansible/)

See the [Chinese README](README.md) for the full navigation.

## Corrections and additions

Maintained by [LMIXR](https://github.com/LMIXR). Contributions and practical CV deployment notes are welcome.

Report outdated steps, suggest improvements, or request a deployment topic through [GitHub Issues](https://github.com/LMIXR/helpfile/issues). Include the operating system, hardware, software versions, and relevant error output.
