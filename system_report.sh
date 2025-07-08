#!/bin/bash

## Lấy hostname
HOSTNAME=$(hostname)

## Lấy ngày giờ hiện tại
DATE_REPORT=$(date '+%Y-%m-%d %H:%M:%S')

## Lấy thông tin CPU
CPU_SPECS=$(lscpu)

## Lấy thông tin phần cứng
HARDWARE_SPEC=$(lshw 2>/dev/null)

## Lấy thông tin thiết bị
LSDEV=$(lsdev 2>/dev/null)

## Lấy thông tin mạng
IP_ADDRESS=$(hostname -I | awk '{print $1}')
MAC_ADDRESS=$(ip link | awk '/ether/ {print $2}' | head -n 1)

## Lấy tên user hiện tại
USER_NAME=$(whoami)

## Đường dẫn file report
REPORT_FILE="/home/${USER_NAME}/report-cp-${HOSTNAME}.txt"

# Ghi thông tin vào file
{
    echo "HOSTNAME: $HOSTNAME"
    echo "DATE REPORT: $DATE_REPORT"
    echo "----------------------------------------------------------------"
    echo "CPU Specs:"
    echo "$CPU_SPECS"
    echo "----------------------------------------------------------------"
    echo "Hardware Spec:"
    echo "$HARDWARE_SPEC"
    echo "----------------------------------------------------------------"
    echo "LSDEV:"
    echo "$LSDEV"
    echo "----------------------------------------------------------------"
    echo "Network Info:"
    echo "IP Address: $IP_ADDRESS"
    echo "MAC Address: $MAC_ADDRESS"
} > "$REPORT_FILE"

echo "Report saved to $REPORT_FILE"
