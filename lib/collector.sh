#!/bin/bash
function get_hostname(){
    hostname
}
function get_ip(){
    hostname -I
}
function get_cpu(){
    grep "model name" | head -n 1 | cut -d ':' -f 2 | xargs
}
function get_ram(){
    free -h | grep "Mem:" | awk '{print $2 "total, " $3 "used, " $4 "free "}'
}
function get_df(){
    df -h --output=source,size,used,pcent,target -x tmpfs -x devtmpfs
}
function get_dpkg(){
    dpkg-query -W -f='${Package} ${Version}\n'
}
function get_runservices(){
    systemctl list-units --type=service --state=running --no-legend | awk '{print $1}'
}
function get_netstat(){
    ss -tulnp | awk 'NR>1 {print $5}'
}
function get_uptime(){
    uptime -p
}
function get_last_update(){
    if [ -f /var/lib/apt/periodic/update-success-stamp ]; then
        stat -c %y /var/lib/apt/periodic/update-success-stamp
    else
        echo "Unknown"
    fi    
}


