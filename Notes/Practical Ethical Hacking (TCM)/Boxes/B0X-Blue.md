## Nmap scan
![[Pasted image 20240206141242.png]]

### Interesting Ports
+ 135 -> msrpc
+ 139 -> netbios-ssn
+ 445 -> smb **Vulnerable, eternal blue**

## msfconsole scans

![[Pasted image 20240206143718.png]]

Vulnerable to ms17_010_eternalblue: exploited within 5 minutes

![[Pasted image 20240206144157.png]]

### Password dump
![[Pasted image 20240206144522.png]]

Administrator:500:aad3b435b51404eeaad3b435b51404ee:58f5081696f366cdc72491a2c4996bd5:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
HomeGroupUser$:1002:aad3b435b51404eeaad3b435b51404ee:f580a1940b1f6759fbdd9f5c482ccdbb:::
user:1000:aad3b435b51404eeaad3b435b51404ee:2b576acbe6bcfda7294d6bd18041b8fe:::


Resources:
+ [Article](https://www.hackingarticles.in/netbios-and-smb-penetration-testing-on-windows/)