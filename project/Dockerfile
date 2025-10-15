FROM ubuntu:22.04

# 기본 패키지
RUN apt update && apt install -y \
  qemu-kvm \
  tightvncserver \
  xfce4 xfce4-goodies \
  novnc websockify \
  wget unzip curl git \
  x11-utils x11-xserver-utils \
  android-sdk \
  && apt clean

# Android 이미지 다운로드
RUN mkdir /android && cd /android && \
  wget https://sourceforge.net/projects/android-x86/files/Release%209.0/android-x86_64-9.0-r2.iso && \
  mv android-x86_64-9.0-r2.iso android.iso

# novnc 설정
RUN mkdir -p /root/noVNC && \
  git clone https://github.com/novnc/noVNC.git /root/noVNC && \
  git clone https://github.com/novnc/websockify.git /root/noVNC/utils/websockify

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080
CMD ["/start.sh"]
