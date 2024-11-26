# Job-Knocker: Modern Knocker-Upper for Your SLURM Jobs

## Introduction

Welcome to Job-Knocker! In the old days, "knocker-uppers" were hired to wake people up for work before alarm clocks were common. Job-Knocker brings that spirit into the modern age, ensuring you never miss a SLURM job notification again. This repository provides a simple and effective way to send notifications to a Discord channel when your SLURM jobs start and end. Whether you're running jobs on a high-performance computing (HPC) cluster or any other environment, Job-Knocker will keep you informed via Discord.

## Features

- Send custom notifications to Discord when SLURM jobs start and end.
- Easily integratable with SLURM job scripts.
- Can be used from Python scripts for broader applicability.
- Customizable messages to include job IDs, timestamps, and more.

## Getting Started

### Prerequisites

- A Discord server with a [webhook](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) URL.
- Basic knowledge of SLURM and Python.

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/giooms/Job-Knocker.git
   cd Job-Knocker
   ```

2. **Make the Notification Script Executable**
   ```bash
   chmod +x notify_discord.sh
   ```

## Usage

### From a SLURM Job Script

1. **Create a SLURM Job Script**
   ```bash
   #!/bin/bash
   #SBATCH --job-name=my_job
   #SBATCH --output=my_job.out
   #SBATCH --error=my_job.err
   #SBATCH --time=01:00:00
   #SBATCH --partition=standard

   # Get the job ID
   JOB_ID=$SLURM_JOB_ID

   # Get the start time
   START_TIME=$(date +"%Y-%m-%d %H:%M:%S")

   # Notify Discord when the job starts
   ./notify_discord.sh "Your SLURM job $JOB_ID has started at $START_TIME."

   # Your job commands here
   echo "Running my job..."
   sleep 30  # Simulate a job running for 30 seconds

   # Get the end time
   END_TIME=$(date +"%Y-%m-%d %H:%M:%S")

   # Notify Discord when the job ends
   ./notify_discord.sh "Your SLURM job $JOB_ID has completed at $END_TIME."
   ```

2. **Submit Your SLURM Job**
   ```bash
   sbatch my_job_script.sh
   ```

### From a Python Script

1. **Create a Python Script**
   ```python
   import subprocess
   import os
   from datetime import datetime

   # Path to the notification script
   notify_script = "./notify_discord.sh"

   # Job ID (you can replace this with the actual job ID if available)
   job_id = "12345"

   # Get the start time
   start_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

   # Notify Discord when the job starts
   start_message = f"Your SLURM job {job_id} has started at {start_time}."
   subprocess.run(["bash", notify_script, start_message])

   # ============================
   # ====== YOUR CODE HERE ======
   # ============================

   # Get the end time
   end_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

   # Notify Discord when the job ends
   end_message = f"Your SLURM job {job_id} has completed at {end_time}."
   subprocess.run(["bash", notify_script, end_message])
   ```

2. **Run Your Python Script**
   ```bash
   python your_python_script.py
   ```

## Customizing the Notification Script

The `notify_discord.sh` script accepts a custom message as a parameter. You can modify the script to include more details or customize the message format as needed.
