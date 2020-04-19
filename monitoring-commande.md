# Monitoring commands:

#### Monitor 3 folders if changes:
`watch ls -la testExtracted testExtract Downloads`

#### Monitor mount:
`watch df -h /dev/sda1`

#### Monitor RAM/memory:
`watch ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem`

#### Monitor CPU:
`watch ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu`
