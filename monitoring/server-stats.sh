#!/bin/bash

# Function to display CPU usage
function cpu_usage() {
    echo "### CPU Usage ###"
    # Display total CPU usage
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'
    echo
}

# Function to display memory usage
function memory_usage() {
    echo "### Memory Usage ###"
    # Display total, used, and free memory
    free -m | awk 'NR==2{printf "Memory Usage: %sMB / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
    echo
}

# Function to display disk usage
function disk_usage() {
    echo "### Disk Usage ###"
    # Display disk usage percentage for the root filesystem
    df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
    echo
}

# Function to display top 5 processes by CPU usage
function top_cpu_processes() {
    echo "### Top 5 CPU consuming processes ###"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    echo
}

# Function to display top 5 processes by memory usage
function top_memory_processes() {
    echo "### Top 5 Memory consuming processes ###"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
    echo
}

# Stretch goal: Additional stats
function additional_stats() {
    echo "### Additional Stats ###"
    echo "OS Version: $(uname -o)"
    echo "Uptime: $(uptime -p)"
    echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
    echo "Logged in users: $(who | wc -l)"
    echo "Failed login attempts: $(grep 'Failed password' /var/log/auth.log | wc -l)"
    echo
}

# Call the functions
cpu_usage
memory_usage
disk_usage
top_cpu_processes
top_memory_processes
