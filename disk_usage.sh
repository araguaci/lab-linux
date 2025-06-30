#!/bin/bash

# Function to check disk usage and save to a .txt file
function create_txt_report() {
    local output_file=$1
    echo "Generating disk usage report in $output_file"
    df -h > "$output_file"
    echo "Disk usage report saved to $output_file"
}

# Function to check disk usage and save to a .log file
function create_log_report() {
    local output_file=$1
    echo "Generating disk usage report in $output_file"
    df -h > "$output_file"
    echo "Disk usage report saved to $output_file"
}

# Function to display disk usage on the console
function display_disk_usage() {
    echo "Displaying disk usage:"
    df -h
}

# Main function to control the flow of the script
function main() {
    local txt_file="disk_usage_report.txt"
    local log_file="disk_usage_report.log"

    # Display disk usage on the console
    display_disk_usage

    # Create .txt report
    create_txt_report "$txt_file"

    # Create .log report
    create_log_report "$log_file"
}

# Execute the main function
main
exit 0