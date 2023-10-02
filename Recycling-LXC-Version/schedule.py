import subprocess
import time

while True:
    try:
        # Define the command you want to run
        command = "sudo sh recycle"
        
        # Run the command using subprocess
        subprocess.run(command, shell=True, check=True)
        
        # Sleep for 3 minutes (180 seconds) before running the command again
        time.sleep(180)
        
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        # You can choose to handle errors in a specific way if needed