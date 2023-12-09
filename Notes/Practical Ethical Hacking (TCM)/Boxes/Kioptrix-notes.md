## Nmap Scan 
![[kioptrix-nmap.png]]
## Open Ports from Nmap
+ 22 - openssh 2.9p2
+ 80 -  http webserver - Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b(header)
+ 111 -  RPCBIND
![[rpcinfo.png]]
+ 139  -  netbios-ssn Samba smbd (workgroup: MYGROUP)
+ 443/tcp   open  ssl/https   Apache/1.3.20 (Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b

## Interesting Vulns from Nikto

+ **Apache is vulnerable to XSS via the Expect header. See: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3918**
+ Apache/1.3.20 - Apache 1.x up 1.2.34 are vulnerable to a remote DoS and possible code execution.
+ **Apache/1.3.20 - Apache 1.3 below 1.3.27 are vulnerable to a local buffer overflow which allows attackers to kill any process on the system.**
+ **Apache/1.3.20 - Apache 1.3 below 1.3.29 are vulnerable to overflows in mod_rewrite and mod_cgi.**
+ **mod_ssl/2.8.4 - mod_ssl 2.8.7 and lower are vulnerable to a remote buffer overflow which may allow a remote shell.**
+ OPTIONS: Allowed HTTP Methods: GET, HEAD, OPTIONS, TRACE .
+ /: HTTP TRACE method is active which suggests the host is vulnerable to XST. See: https://owasp.org/www-community/attacks/Cross_Site_Tracing
+ **/usage/: Webalizer may be installed. Versions lower than 2.01-09 vulnerable to Cross Site Scripting (XSS). See: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0835

+ /test.php: This might be interesting.
+ **/wp-content/themes/twentyeleven/images/headers/server.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /wordpress/wp-content/themes/twentyeleven/images/headers/server.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /wp-includes/Requests/Utility/content-post.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /wordpress/wp-includes/Requests/Utility/content-post.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /wp-includes/js/tinymce/themes/modern/Meuhy.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /wordpress/wp-includes/js/tinymce/themes/modern/Meuhy.php?filesrc=/etc/hosts: A PHP backdoor file manager was found.
+ /assets/mobirise/css/meta.php?filesrc=: A PHP backdoor file manager was found.
+ /login.cgi?cli=aa%20aa%27cat%20/etc/hosts: Some D-Link router remote command execution.
+ /shell?cat+/etc/hosts: A backdoor was identified.
+ /#wp-config.php#: #wp-config.php# file found. This file contains the credentials.
+ 8908 requests: 0 error(s) and 30 item(s) reported on remote host
+ End Time:           2023-11-13 05:45:57 (GMT-5) (34 seconds)

## Summary 
+ _***os**_: Redhat Linux 2.4.x
+ _**Running**_:
	+ appache 1.3.20 
		+ http - 80
		+ https - 443
		+ mod_ssl/2.8.4 
	+ netbios-sn  - samba - smb -139
		+ Unix (Samba 2.2.1a)
	+ webalizer
	+ wordpress
## Tried:
#### +smb anonymous login: `smbclient -L \\\\10.0.1.0`  
![[smbclient.png]]
	+ IPC$ and ADMIN$ where a dead end. I could login to IPC$ but with no privileges. 

## Research for Exploits:
+  mod_ssl/2.8.4:
	+ OpenFuck-exploitdb: https://www.exploit-db.com/exploits/47080 
	+ OpenFuck-git:  https://www.exploit-db.com/exploits/47080
+ Samba 2.2.1a port 139
	+ Vulnerable to remote buffer overflow:  
		+ git: https://github.com/piyush-saurabh/exploits/blob/master/smb-exploit.c
		+ Exlpoit-db: https://www.exploit-db.com/exploits/10
		+ Raid-7 (msfconsole - trans2open): https://github.com/rapid7/metasploit-framework/blob/master/modules/exploits/linux/samba/trans2open.rb
## Tools of Trade
+ netdiscorver
+ nmap
+ nessus
+ nickto
+ dirbuster and gobuster for http(s) enumeration
+ metasploit for smb enumeration and exploitation
+ smbclient