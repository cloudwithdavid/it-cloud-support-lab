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
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n\n' "$0"
      printf 'Options:\n'
      printf '  -s  Service name to check with systemctl and journalctl\n'
      printf '  -i  External IP to test with ping. Default: 8.8.8.8\n'
      printf '  -u  Test URL to check with curl. Default: https://example.com\n'
      printf '  -h  Show this help message\n'
      exit 0
      ;;
    :)
      printf 'Error: option -%s requires a value\n' "$OPTARG"
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n' "$0"
      exit 1
      ;;
    \?)
      printf 'Error: invalid option -%s\n' "$OPTARG"
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n' "$0"
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

printf '%s\n' "--- Collecting Evidence ---" | tee -a "$output_file"
printf 'Timestamp: %s\n' "$timestamp" | tee -a "$output_file"
printf 'Host: %s\n' "$current_host" | tee -a "$output_file"
printf 'User: %s\n' "$current_user" | tee -a "$output_file"

if [[ -n "$service_name" ]]; then
  printf 'Service: %s\n' "$service_name" | tee -a "$output_file"
else
  printf 'Service: not provided\n' | tee -a "$output_file"
fi

printf 'External IP Target: %s\n' "$external_ip" | tee -a "$output_file"
printf 'Test URL: %s\n' "$test_url" | tee -a "$output_file"

printf '\n--- Disk Usage ---\n' | tee -a "$output_file"
df -h 2>&1 | tee -a "$output_file" \
  || printf 'Disk usage information could not be collected\n' | tee -a "$output_file"

printf '\n--- Service Status ---\n' | tee -a "$output_file"
if [[ -n "$service_name" ]]; then
  systemctl status "$service_name" --no-pager 2>&1 | tee -a "$output_file" \
    || printf 'Result: service status could not be collected\n' | tee -a "$output_file"
else
  printf 'Result: skipped because no service name was provided\n' | tee -a "$output_file"
fi

printf '\n--- Recent Journal Logs ---\n' | tee -a "$output_file"
if [[ -n "$service_name" ]]; then
  journalctl -u "$service_name" -n 25 --no-pager 2>&1 | tee -a "$output_file" \
    || printf 'Result: recent journal logs could not be collected\n' | tee -a "$output_file"
else
  printf 'Result: skipped because no service name was provided\n' | tee -a "$output_file"
fi

printf '\n--- Listening Ports ---\n' | tee -a "$output_file"
ss -tuln 2>&1 | tee -a "$output_file" \
  || printf 'Listening ports information could not be collected\n' | tee -a "$output_file"

printf '\n--- Routing Table ---\n' | tee -a "$output_file"
ip route 2>&1 | tee -a "$output_file" \
  || printf 'Routing table information could not be collected\n' | tee -a "$output_file"

printf '\n--- External IP Reachability ---\n' | tee -a "$output_file"
ping -c 4 "$external_ip" 2>&1 | tee -a "$output_file" \
  || printf 'External IP reachability check failed; external IP did not respond or could not be reached\n' | tee -a "$output_file"

printf '\n--- External URL Reachability ---\n' | tee -a "$output_file"
curl -sSI --max-time 5 "$test_url" 2>&1 | tee -a "$output_file" \
  || printf 'External URL reachability check failed; external URL did not return a reachable HTTP response\n' | tee -a "$output_file"

printf '\nEvidence saved to: %s\n' "$output_file"
