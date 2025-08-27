# get total CPU usage
function get_cpu_usage() {
    echo "===== Total CPU Usage ====="
    idle=$(mpstat 1 1 | awk '/Average/ {print 100 - $12}')
    echo "CPU Usage: ${idle}%"
    echo ""
}

# get total memory usage
function get_memory_usage() {
    echo "===== Total Memory Usage ====="
    mem_info=$(free -m | awk 'NR==2{printf "Total: %s MB, Used: %s MB, Free: %s MB (%.2f%% used)\n", $2, $3, $4, $3*100/$2}')
    echo "$mem_info"
    echo ""
}

# get total disk usage
function get_disk_usage() {
    echo "===== Total Disk Usage ====="
    disk_info=$(df -h / | awk 'NR==2{printf "Used: %s, Available: %s, Usage: %s\n", $3, $4, $5}')
    echo "$disk_info"
    echo ""
}

# get OS version
function get_os_version() {
    echo "===== OS Version ====="
    os_version=$(lsb_release -d | awk -F"\t" '{print $2}')
    echo "OS Version: $os_version"
    echo ""
}

# get uptime
function get_uptime() {
    echo "===== Uptime ====="
    uptime_info=$(uptime -p)
    echo "Uptime: $uptime_info"
    echo ""
}

# get load average
function get_load_average() {
    echo "===== Load Average ====="
    load_avg=$(uptime | awk -F'load average:' '{print $2}' | sed 's/^ *//')
    echo "Load Average: $load_avg"
    echo ""
}

# get logged in users
function get_logged_in_users() {
    echo "===== Logged In Users ====="
    logged_in=$(who | wc -l)
    echo "Number of Logged In Users: $logged_in"
    echo ""
}

# get top 5 processes by CPU usage
function get_top_cpu_processes() {
    echo "===== Top 5 Processes by CPU Usage ====="
    top_cpu=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
    echo "$top_cpu"
    echo ""
}

# get top 5 processes by memory usage
function get_top_memory_processes() {
    echo "===== Top 5 Processes by Memory Usage ====="
    top_mem=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
    echo "$top_mem"
    echo ""
}


get_cpu_usage
get_memory_usage
get_disk_usage
get_os_version
get_uptime
get_load_average
get_logged_in_users
get_top_cpu_processes
get_top_memory_processes
