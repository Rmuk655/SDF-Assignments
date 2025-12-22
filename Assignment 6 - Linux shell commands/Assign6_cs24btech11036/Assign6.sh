#!/bin/bash

# This is the directory we are supposed to monitor.
echo "Enter the directory to monitor for changes:"
read MAIN_DIR

# This is the backup directory where we store latest modified version of files in the main directory.
echo "Enter the directory where backups should be saved:"
read BACK_DIR

# We are now checking if the backup directory exists (Using -d command). If it does not, we create a directory with the same name. 
# , where we use -p to signify that it is a parent directory.
if [ ! -d "$BACK_DIR" ]; then
  mkdir -p "$BACK_DIR"
  echo "The backup directory has been created: $BACK_DIR"
fi

# Monitor the directory for any changes/modification to the files present in the directory.
echo "We are now monitoring the directory: $MAIN_DIR"
echo "Type 'exit' to stop the monitoring the directory $MAIN_DIR."

while true
do
  # We now wait for any changes in the directory being monitored using the module inotifywait.
  # -e is used to check if the directory MAIN_DIR exists or not
  # -r where r stands for recursion: Makes sure we monitor all sub directories of the main directories.
  # > /dev/null redirects the standard output of the command to /dev/null, which discards it.
  # 2>&1 redirects the standard error of the command to the same place as the standard output (/dev/null).
  inotifywait -e modify -r "$MAIN_DIR" > /dev/null 2>&1
  
  # Checks if the user has typed 'exit', and if he has typed exit, then we break the loop and stop monitoring the directory.
  if [ "$1" == "exit" ]; then
    echo "Exiting the backup monitoring process."
    break
  fi
  
  # We now list all the modified files present in the directory MAIN_DIR.
  # find command searches for all directories/files satisfying the conditions specified in the given directory MAIN_DIR
  # -type f indicates that we only need to look for files and not directories.
  # newermt (short form for newer modification time with the modification as a reference) is used to find files modified after a given time specified.
  # date -d '1 second ago' '+%Y-%m-%d %H:%M:%S' is used to get the time 1 second before the current time
  modi_files=$(find "$MAIN_DIR" -type f -newermt "$(date -d '1 second ago' '+%Y-%m-%d %H:%M:%S')")
  
  # We now have to create backups for each file in the directory MAIN_DIR which has been modified.
  for file in $modi_files
  do
    # We now generate a timestamp for each modified file.
    timestamp=$(date '+%Y%m%d_%H%M%S')
    
    # Gets the base filename without specifying the path that leads to this file.
    filename=$(basename "$file")
    
    # We now create the backup filename by appending the timestamp to the base filename (In variable filename).
    backup_filename="${filename%.*}_$timestamp.${filename##*.}"
    
    # We now copy the file to the backup directory created earlier.
    cp "$file" "$backup_dir/$backup_filename"
    echo "Backup created: $backup_dir/$backup_filename"
  done
done