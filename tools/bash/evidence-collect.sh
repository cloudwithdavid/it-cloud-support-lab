#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 1 || "$#" -gt 2 ]]; then
  echo "Usage: $0 <service-name> [test-url]"
  exit 1
fi

service_name="$1"
test_url="${2:-https://example.com}"
external_ip="8.8.8.8"
current_host="$(hostname)"
current_user="$(whoami)"
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
file_timestamp="$(date '+%Y%m%d-%H%M%S')"
output_dir="evidence"
output_file="${output_dir}/${file_timestamp}-${current_host}.txt"

mkdir -p "$output_dir"
: > "$output_file"

echo "--- Collecting Evidence ---" | tee -a "$output_file"
echo "Timestamp: $timestamp" | tee -a "$output_file"
echo "Host: $current_host" | tee -a "$output_file"
echo "User: $current_user" | tee -a "$output_file"
echo "Service: $service_name" | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- Disk Usage ---" | tee -a "$output_file"
df -h / 2>&1 | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- Service Status ---" | tee -a "$output_file"
if systemctl status "$service_name" --no-pager 2>&1 | tee -a "$output_file"; then
  echo | tee -a "$output_file"
  echo "Result: service status collected" | tee -a "$output_file"
else
  echo | tee -a "$output_file"
  echo "Result: service status could not be collected" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "--- Recent Journal Logs ---" | tee -a "$output_file"
if journalctl -u "$service_name" -n 25 --no-pager 2>&1 | tee -a "$output_file"; then
  echo | tee -a "$output_file"
  echo "Result: recent journal logs collected" | tee -a "$output_file"
else
  echo | tee -a "$output_file"
  echo "Result: recent journal logs could not be collected" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "--- Listening Ports ---" | tee -a "$output_file"
ss -tuln 2>&1 | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- Routing Table ---" | tee -a "$output_file"
ip route 2>&1 | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- External IP Reachability ---" | tee -a "$output_file"
if ping -c 4 "$external_ip" 2>&1 | tee -a "$output_file"; then
  echo | tee -a "$output_file"
  echo "External IP reachability: PASS" | tee -a "$output_file"
else
  echo | tee -a "$output_file"
  echo "External IP reachability: FAIL" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "--- External URL Reachability ---" | tee -a "$output_file"
if curl -sSI --max-time 5 "$test_url" 2>&1 | tee -a "$output_file"; then
  echo | tee -a "$output_file"
  echo "External URL reachability: PASS" | tee -a "$output_file"
else
  echo | tee -a "$output_file"
  echo "External URL reachability: FAIL" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "Evidence saved to: $output_file"