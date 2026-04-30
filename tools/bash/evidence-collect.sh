#!/usr/bin/env bash

# evidence-collect.sh
# Reusable first-pass Linux networking and service evidence collection utility.
#
# Collects service status, recent service logs, listening ports, routing, external reachability, and disk usage into a timestamped file.
#
# Example:
#   ./evidence-collect.sh -s cron -u https://example.com -i 1.1.1.1

set -euo pipefail

service_name=""
external_ip="8.8.8.8"
test_url="https://example.com"
output_dir="evidence"

while getopts ":s:i:u:h" opt; do
  case "$opt" in
    s)
      service_name="$OPTARG"
      ;;
    i)
      external_ip="$OPTARG"
      ;;
    u)
      test_url="$OPTARG"
      ;;
    h)
      echo "Usage: $0 [-s service-name] [-i external-ip] [-u test-url]"
      echo
      echo "Options:"
      echo "  -s  Service name to check with systemctl and journalctl"
      echo "  -i  External IP to test with ping. Default: 8.8.8.8"
      echo "  -u  Test URL to check with curl. Default: https://example.com"
      echo "  -h  Show this help message"
      exit 0
      ;;
    :)
      echo "Error: option -$OPTARG requires a value"
      echo "Usage: $0 [-s service-name] [-i external-ip] [-u test-url]"
      exit 1
      ;;
    \?)
      echo "Error: invalid option -$OPTARG"
      echo "Usage: $0 [-s service-name] [-i external-ip] [-u test-url]"
      exit 1
      ;;
  esac
done

current_host="$(hostname)"
current_user="$(whoami)"
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
file_timestamp="$(date '+%Y%m%d-%H%M%S')"

mkdir -p "$output_dir"

output_file="${output_dir}/${file_timestamp}-${current_host}.txt"

: > "$output_file"

echo "--- Collecting Evidence ---" | tee -a "$output_file"
echo "Timestamp: $timestamp" | tee -a "$output_file"
echo "Host: $current_host" | tee -a "$output_file"
echo "User: $current_user" | tee -a "$output_file"

if [[ -n "$service_name" ]]; then
  echo "Service: $service_name" | tee -a "$output_file"
else
  echo "Service: not provided" | tee -a "$output_file"
fi

echo "External IP Target: $external_ip" | tee -a "$output_file"
echo "Test URL: $test_url" | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- Disk Usage ---" | tee -a "$output_file"
df -h / 2>&1 | tee -a "$output_file"

echo | tee -a "$output_file"
echo "--- Service Status ---" | tee -a "$output_file"

if [[ -n "$service_name" ]]; then
  if systemctl status "$service_name" --no-pager 2>&1 | tee -a "$output_file"; then
    echo "Result: service status collected" | tee -a "$output_file"
  else
    echo "Result: service status could not be collected" | tee -a "$output_file"
  fi
else
  echo "Result: skipped because no service name was provided" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "--- Recent Journal Logs ---" | tee -a "$output_file"

if [[ -n "$service_name" ]]; then
  if journalctl -u "$service_name" -n 25 --no-pager 2>&1 | tee -a "$output_file"; then
    echo "Result: recent journal logs collected" | tee -a "$output_file"
  else
    echo "Result: recent journal logs could not be collected" | tee -a "$output_file"
  fi
else
  echo "Result: skipped because no service name was provided" | tee -a "$output_file"
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
  echo "External IP reachability: PASS" | tee -a "$output_file"
else
  echo "External IP reachability: FAIL" | tee -a "$output_file"
fi

echo | tee -a "$output_file"
echo "--- External URL Reachability ---" | tee -a "$output_file"

if curl -sSI --max-time 5 "$test_url" 2>&1 | tee -a "$output_file"; then
  echo "External URL reachability: PASS" | tee -a "$output_file"
else
  echo "External URL reachability: FAIL" | tee -a "$output_file"
fi

echo
echo "Evidence saved to: $output_file"
