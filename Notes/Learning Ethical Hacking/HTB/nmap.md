Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing.

## Host Discovery scan
```shell-session
nmap 10.129.2.0/24 -sn -oA tnet | grep for | cut -d" " -f5
# -sn      Disables port scanning.
# `-oA tnet` Stores the results in all formats starting with the name 'tnet'.
```

#### NB: 
```shell-session
sudo nmap -sn -oA tnet -iL hosts.lst -PE --packet-trace 
# -iL   Performs defined scans against targets in provided 'hosts.lst' list.
# -PE   Performs a ping scan by using 'ICMP Echo requests' against the target.
# --packet-trace  Shows all sent and reveived packets
# -n   Disables DNS resolution.
# --disable-arp-ping   Disables ARP ping.
# -Pn  Disables ICMP Echo requests.
# -F   Scans top 100 ports.
# -sU  Performs a UDP scan.
```

## Host & Port Scanning

### Port states
| **State**          | **Description**                                                                                                                                                                                         |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `open`             | This indicates that the connection to the scanned port has been established. These connections can be **TCP connections**, **UDP datagrams** as well as **SCTP associations**.                          |
| `closed`           | When the port is shown as closed, the TCP protocol indicates that the packet we received back contains an `RST` flag. This scanning method can also be used to determine if our target is alive or not. |
| `filtered`         | Nmap cannot correctly identify whether the scanned port is open or closed because either no response is returned from the target for the port or we get an error code from the target.                  |
| `unfiltered`       | This state of a port only occurs during the **TCP-ACK** scan and means that the port is accessible, but it cannot be determined whether it is open or closed.                                           |
| `open\|filtered`   | If we do not get a response for a specific port, `Nmap` will set it to that state. This indicates that a firewall or packet filter may protect the port.                                                |
| `closed\|filtered` | This state only occurs in the **IP ID idle** scans and indicates that it was impossible to determine if the scanned port is closed or filtered by a firewall.                                           |
## Saving Scan Results
- Normal output (`-oN`) with the `.nmap` file extension
- Grep-able output (`-oG`) with the `.gnmap` file extension
- XML output (`-oX`) with the `.xml` file extension
- Saves the results in all formats, (`-oA`)
-  `xsltproc`: Tool used to convert xml nmap output to html reports
	-  syntax: `xsltproc target.xml -o report.html`
## Scripting Engine
There are a total of 14 categories into which these scripts can be divide

| **Category** | **Description**                                                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| `auth`       | Determination of authentication credentials.                                                                                            |
| `broadcast`  | Scripts, which are used for host discovery by broadcasting and the discovered hosts, can be automatically added to the remaining scans. |
| `brute`      | Executes scripts that try to log in to the respective service by brute-forcing with credentials.                                        |
| `default`    | Default scripts executed by using the `-sC` option.                                                                                     |
| `discovery`  | Evaluation of accessible services.                                                                                                      |
| `dos`        | These scripts are used to check services for denial of service vulnerabilities and are used less as it harms the services.              |
| `exploit`    | This category of scripts tries to exploit known vulnerabilities for the scanned port.                                                   |
| `external`   | Scripts that use external services for further processing.                                                                              |
| `fuzzer`     | This uses scripts to identify vulnerabilities and unexpected packet handling by sending different fields, which can take much time.     |
| `intrusive`  | Intrusive scripts that could negatively affect the target system.                                                                       |
| `malware`    | Checks if some malware infects the target system.                                                                                       |
| `safe`       | Defensive scripts that do not perform intrusive and destructive access.                                                                 |
| `version`    | Extension for service detection.                                                                                                        |
| `vuln`       | Identification of specific vulnerabilities.                                                                                             |

- `-sC`: Enables the most common scripts.
- `--script`: Chooses scripts by category, directory, or individual script filename.
- `--script-args` and `script-args-file`: Provides arguments to scripts that use/require them.
- `--script-help`: Shows a description of what each selected script does.