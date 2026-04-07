# KB — Wi-Fi Connected but No Internet (DNS Failure)

> Knowledge Base created in a simulated support lab.

## Purpose

Explain how to identify and troubleshoot a Wi-Fi-connected endpoint that cannot access internet resources because name resolution may be failing.

## When to Use This KB

Use this KB when a Windows endpoint is connected to Wi-Fi but cannot load websites or internet-dependent applications, especially when the issue appears limited to one device.

## Symptom Pattern

- Endpoint is connected to the intended Wi-Fi network
- Internet-dependent sites or applications do not work on the affected device
- Other devices on the same network still have internet access

## Likely Causes

- Device has incorrect IP, gateway, or DNS settings
- Device can connect to Wi-Fi but cannot properly reach the network path out
- DNS is not resolving even though basic connectivity still works

## Recommended Checks

1. Check whether other devices on the same network are affected
   - Why it matters: Helps show whether this is one device having a problem or a wider network issue
   - What the result suggests: If only one device is affected, focus on the endpoint. If multiple devices are affected, the issue may be with the network or DNS service itself

2. Review IP configuration with `ipconfig /all`
   - Why it matters: Checks whether the device has a valid IP address, default gateway, and DNS server listed
   - What the result suggests: Missing or incorrect values point to a local network configuration issue. Valid values support moving to connectivity and DNS checks

3. Test gateway and public IP reachability
   - Why it matters: Checks whether the device can reach the local network gateway and the internet without relying on DNS
   - What the result suggests: If the gateway or public IP cannot be reached, the issue is broader than DNS. If both work, basic connectivity is working

4. Test DNS resolution with `nslookup`
   - Why it matters: Checks whether the device can resolve domain names
   - What the result suggests: If public IP works but DNS lookup fails, DNS is the likely issue

## Typical Resolution

1. Refresh the endpoint network connection by disconnecting and reconnecting Wi-Fi
2. Re-test DNS resolution and internet access
3. If DNS still fails, review DNS settings or escalate for network-level review

## Verification

- DNS lookups return valid results
- Websites and internet-dependent apps work normally

## Escalate If

- DNS still fails after endpoint-level reset or correction
- Multiple devices on the same network show the same issue

## Notes

This KB is based on a simulated Windows endpoint case in the lab.
It focuses on basic first-line troubleshooting for Wi-Fi connected but no internet scenarios where DNS is the likely fault area.
