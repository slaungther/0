#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e ""
# IP Validation
IPVPS=$(curl -s ifconfig.me/ip )

# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi

# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
clear
REGION=$( curl -s ipinfo.io/region )
clear
COUNTRY=$( curl -s ipinfo.io/country )
clear
WAKTU=$( curl -s ipinfo.ip/timezone )
clear
CITY=$( curl -s ipinfo.io/city )
clear
REGION=$( curl -s ipinfo.io/region )
clear
WAKTUE=$( curl -s ipinfo.io/timezone )
clear
koordinat=$( curl -s ipinfo.io/loc )
clear
NC='\033[0m'
echo -e "$NC"

# Color Validation
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# Ram Usage
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))

# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# Total Ram
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# Tipe Processor
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Kernel Terbaru
kernelku=$(uname -r)

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS Patch
tipeos2=$(uname -m)

# Getting Domain Name
Domen="$(cat /etc/v2ray/domain)"

# Echoing Result
echo -e ""
echo -e "$yy In Here Is Your VPS Information : $y"
echo -e "$m---------------------------------------------------------------------$wh"
echo -e "$yy Operating System Information :$y"
echo -e "$yl VPS Type    : $typevps"
echo -e "$yl OS Arch     : $tipeos2"
echo -e "$yl Hostname    : $HOSTNAME"
echo -e "$yl OS Name     : $Tipe"
echo -e "$yl OS Version  : $Versi_OS"
echo -e "$yl OS URL      : $URL_SUPPORT"
echo -e "$yl OS BASE     : $basedong"
echo -e "$yl OS TYPE     : Linux / Unix"
echo -e "$yl Bash Ver    : $versibash"
echo -e "$yl Kernel Ver  : $kernelku"
echo -e "$m---------------------------------------------------------------------$wh"
echo -e "$yy Hardware Information :$y"
echo -e "$yl Processor   : $tipeprosesor"
echo -e "$yl Proc Core   : $totalcore"
echo -e "$yl Virtual     : $typevps"
echo -e "$yl Cpu Usage   : $cpu_usage"
echo -e "$m---------------------------------------------------------------------$wh"
echo -e "$yy System Status / System Information :$y"
echo -e "$yl Uptime      : $uptime ( From VPS Booting )"
echo -e "$yl Total RAM   : ${totalram}MB"
echo -e "$yl Avaible     : ${MEMORY}MB"
echo -e "$yl Download    : $downloadsize GB ( From Startup / VPS Booting )"
echo -e "$yl Upload      : $uploadsize GB ( From Startup / VPS Booting )"
echo -e "$m---------------------------------------------------------------------$wh"
echo -e "$yy Internet Service Provider Information :$y"
echo -e "$yl Public IP   : $IPVPS"
echo -e "$yl Domain      : $Domen"
echo -e "$yl ISP Name    : $NAMAISP"
echo -e "$yl Region      : $REGION "
echo -e "$yl Country     : $COUNTRY"
echo -e "$yl City        : $CITY "
echo -e "$yl Time Zone   : $WAKTUE"
echo -e "$m---------------------------------------------------------------------$wh"
echo -e "$yy Time & Date & Location & Coordinate Information :$y"
echo -e "$yl Location    : $COUNTRY"
echo -e "$yl Coordinate  : $koordinat"
echo -e "$yl Time Zone   : $WAKTUE"
echo -e "$yl Date        : $harini"
echo -e "$yl Time        : $jam ( WIB )"
echo -e "$m---------------------------------------------------------------------$wh"
echo ""
echo -e "$m------------------------=$yy SSH & OPENVPN $m=----------------------------$wh"
echo -e "$yy 1$y. $yl Create SSH & OpenVPN Account (add-ssh)"
echo -e "$yy 2$y. $yl Generate SSH & OpenVPN Trial Account (trial-ssh)"
echo -e "$yy 3$y. $yl Extending SSH & OpenVPN Account Active Life (renew-ssh)"
echo -e "$yy 4$y. $yl Delete SSH & OpenVpn Account (delete-ssh)"
echo -e "$yy 5$y. $yl Check User Login SSH & OpenVPN (cek-ssh)"
echo -e "$yy 6$y. $yl Daftar Member SSH & OpenVPN (member)"
echo -e "$yy 7$y. $yl Delete User Expired SSH & OpenVPN (del-exp)"
echo -e "$yy 8$y. $yl Set up Autokill SSH (autokill)"
echo -e "$yy 9$y. $yl Displays Users Who Do Multi Login SSH (ceklim)"
echo -e "$yy 10$y.$yl Restart Service Dropbear, Squid3, OpenVPN dan SSH (restart)"
echo -e ""
echo -e "$m--------------------------=$yy WIREGUARD $m=------------------------------$wh"
echo -e "$yy 11$y.$yl Create Account Wireguard (add-wg)"
echo -e "$yy 12$y.$yl Delete Account Wireguard (del-wg)"
echo -e "$yy 13$y.$yl Check User Login Wireguard (cek-wg)"
echo -e "$yy 14$y.$yl Extending Account Wireguard Active Life (renew-wg)"
echo -e "$yy 15$y.$yl Check Wireguard User Interface(wg-show)"
echo -e ""
echo -e "$m-----------------------------=$yy L2TP $m=--------------------------------$wh"
echo -e "$yy 16$y.$yl Create Account L2TP (add-l2tp)"
echo -e "$yy 17$y.$yl Delete Account L2TP (del-l2tp)"
echo -e "$yy 18$y.$yl Extending Account L2TP Active Life (renew-l2tp)"
echo -e ""
echo -e "$m-----------------------------=$yy PPTP $m=--------------------------------$wh"
echo -e "$yy 19$y.$yl Create Account PPTP (add-pptp)"
echo -e "$yy 20$y.$yl Delete Account PPTP (del-pptp)"
echo -e "$yy 21$y.$yl Extending Account PPTP Active Life (renew-pptp)"
echo -e "$yy 22$y.$yl Check User Login Wireguard (cek-pptp)"
echo -e ""
echo -e "$m-----------------------------=$yy SSTP $m=--------------------------------$wh"
echo -e "$yy 23$y.$yl Create Account SSTP (add-sstp)"
echo -e "$yy 24$y.$yl Delete Account SSTP (del-sstp)"
echo -e "$yy 25$y.$yl Extending Account SSTP Active Life (renew-sstp)"
echo -e "$yy 26$y.$yl Check User Login SSTP (cek-sstp)"
echo -e ""
echo -e "$m--------------------------=$yy SHADOWSOCKSR $m=---------------------------$wh"
echo -e "$yy 27$y.$yl Create Account SSR (add-ssr)"
echo -e "$yy 28$y.$yl Delete Account SSR (del-ssr)"
echo -e "$yy 29$y.$yl Extending Account SSR Active Life (renew-ssr)"
echo -e "$yy 30$y.$yl Show Other SSR Menu (ssr)"
echo -e ""
echo -e "$m--------------------------=$yy SHADOWSOCKS $m=----------------------------$wh"
echo -e "$yy 31$y.$yl Create Account Shadowsocks (add-ss)"
echo -e "$yy 32$y.$yl Delete Account Shadowsocks (del-ss)"
echo -e "$yy 33$y.$yl Extending Account Shadowsocks Active Life (renew-ss)"
echo -e "$yy 34$y.$yl Check User Login Shadowsocks (cek-ss)"
echo -e ""
echo -e "$m--------------------------=$yy V2RAY / VMESS $m=--------------------------$wh"
echo -e "$yy 35$y.$yl Create Account V2RAY Vmess Websocket (add-vmess)"
echo -e "$yy 36$y.$yl Delete Account V2RAY Vmess Websocket (del-vmess)"
echo -e "$yy 37$y.$yl Extending Account Vmess Active Life (renew-vmess)"
echo -e "$yy 38$y.$yl Check User Login V2RAY (cek-vmess)"
echo -e "$yy 39$y.$yl Renew Certificate V2RAY Account (cert2vray)"
echo -e ""
echo -e "$m--------------------------=$yy V2RAY / VLESS $m=--------------------------$wh"
echo -e "$yy 40$y.$yl Create Account V2RAY Vless Websocket (add-vless)"
echo -e "$yy 41$y.$yl Delete Account V2RAY Vless Websocket (del-vless)"
echo -e "$yy 42$y.$yl Extending Account Vless Active Life (renew-vless)"
echo -e "$yy 43$y.$yl Check User Login V2RAY (cek-vless)"
echo -e ""
echo -e "$m----------------------------=$yy TROJAN GFW $m=---------------------------$wh"
echo -e "$yy 44$y.$yl Create Account Trojan (add-tr)"
echo -e "$yy 45$y.$yl Deleting Account Trojan (del-tr)"
echo -e "$yy 46$y.$yl Extending Account Trojan Active Life (renew-tr)"
echo -e "$yy 47$y.$yl Check User Login Trojan (cek-tr)"
echo -e ""
echo -e "$m------------------------------=$yy SYSTEM $m=----------------------------$wh"
echo -e "$yy 48$y.$yl Add Or Change Subdomain Host For VPS (add-host)"
echo -e "$yy 49$y.$yl Change Port Of Some Service (change-port)"
echo -e "$yy 50$y.$yl Webmin Menu (wbmn)"
echo -e "$yy 51$y.$yl Limit Bandwith Speed Server (limit-speed)"
echo -e "$yy 52$y.$yl Check Usage of VPS Ram (ram)"
echo -e "$yy 53$y.$yl Reboot VPS (reboot)"
echo -e "$yy 54$y.$yl Speedtest VPS (speedtest)"
echo -e "$yy 55$y.$yl Displaying System Information (info)"
echo -e "$yy 56$y.$yl Info Script Auto Install (about)"
echo -e "$yy 57$y.$yl Exit From VPS (axit) "
echo -e ""
echo -e "$m====================================================================$y"
echo -e ""
echo -e "$m1 GEO GABUT $m​​​​​"
echo -e ""
read -p "Select From Options [ 1 - 57 ] : " menu
echo -e ""
case $menu in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
add-wg
;;
12)
del-wg
;;
13)
cek-wg
;;
14)
renew-wg
;;
15)
wg show
;;
16)
add-l2tp
;;
17)
del-l2tp
;;
18)
renew-l2tp
;;
19)
add-pptp
;;
20)
del-pptp
;;
21)
renew-pptp
;;
22)
cek-pptp
;;
23)
add-sstp
;;
24)
del-sstp
;;
25)
renew-sstp
;;
26)
cek-sstp
;;
27)
add-ssr
;;
28)
del-ssr
;;
29)
renew-ssr
;;
30)
ssr
;;
31)
add-ss
;;
32)
del-ss
;;
33)
renew-ss
;;
34)
cek-ss
;;
35)
add-ws
;;
36)
del-ws
;;
37)
renew-ws
;;
38)
cek-ws
;;
39)
certv2ray
;;
40)
add-vless
;;
41)
del-vless
;;
42)
renew-vless
;;
43)
cek-ws
;;
44)
add-tr
;;
45)
del-tr
;;
46)
renew-tr
;;
47)
cek-tr
;;
48)
add-host
;;
49)
change
;;
50)
wbmn
;;
51)
limit-speed
;;
52)
ram
;;
53)
reboot
;;
54)
speedtest
;;
55)
info
;;
56)
about
;;
57)
exit
;;
*)
clear
menu
;;
esac

