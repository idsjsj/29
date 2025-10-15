#!/bin/bash
export DISPLAY=:1
vncserver :1 -geometry 720x1280 -depth 24 &

# QEMU로 Android 실행
qemu-system-x86_64 \
  -m 2048 \
  -smp 2 \
  -machine accel=kvm \
  -cdrom /android/android.iso \
  -boot d \
  -vga virtio \
  -display vnc=:1 &

# noVNC 실행
cd /root/noVNC
./utils/launch.sh --vnc localhost:5901 --listen 8080
