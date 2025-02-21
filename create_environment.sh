#!/bin/bash

# Asking for a user name
echo "Enter your name here:"
read user_name

# Define the application directory
app_dir="submission_reminder_${user_name}"

# Creating the parent directory
mkdir -p "$app_dir"

# Creating subdirectories
mkdir -p "$app_dir/app"
mkdir -p "$app_dir/modules"
mkdir -p "$app_dir/assets"
mkdir -p "$app_dir/config"

# Creating files in their respective subdirectories
reminder="$app_dir/app/reminder.sh"
functions="$app_dir/modules/functions.sh"
submissions="$app_dir/assets/submissions.txt"
config="$app_dir/config/config.env"
startup="$app_dir/startup.sh"

# Creating necessary files
touch "$reminder" "$functions" "$submissions" "$config" "$startup"

# Adding execution permission to all .sh files
chmod +x "$app_dir"/**/*.sh "$app_dir"/*.sh

# Writing the reminder script
echo "#!/bin/bash" > "$reminder"
echo "" >> "$reminder"
echo "# Source environment variables and helper functions" >> "$reminder"
echo "source ./config/config.env" >> "$reminder"
echo "source ./modules/functions.sh" >> "$reminder"
echo "" >> "$reminder"
echo "# Path to the submissions file" >> "$reminder"
echo "submissions_file=\"./assets/submissions.txt\"" >> "$reminder"
echo "" >> "$reminder"
echo "# Print remaining time and run the reminder function" >> "$reminder"
echo "echo \"Assignment: \$ASSIGNMENT\"" >> "$reminder"
echo "echo \"Days remaining to submit: \$DAYS_REMAINING days\"" >> "$reminder"
echo "echo \"--------------------------------------------\"" >> "$reminder"
echo "" >> "$reminder"
echo "check_submissions \$submissions_file" >> "$reminder"

# Writing the submissions file
echo "student, assignment, submission status" > "$submissions"
echo "Chinemerem, Shell Navigation, not submitted" >> "$submissions"
echo "Chiagoziem, Git, submitted" >> "$submissions"
echo "Divine, Shell Navigation, not submitted" >> "$submissions"
echo "Anissa, Shell Basics, submitted" >> "$submissions"
echo "Clet, Shell Navigation, submitted" >> "$submissions"
echo "Kelvin, Shell Navigation, not submitted" >> "$submissions"
echo "Christian, Shell Navigation, submitted" >> "$submissions"
echo "Derick, Shell Navigation, not submitted" >> "$submissions"
echo "Cassi, Shell Navigation, submitted" >> "$submissions"

# Putting contents in the config file
echo "# This is the config file" > "$config"
echo "ASSIGNMENT=\"Shell Navigation\"" >> "$config"
echo "DAYS_REMAINING=2" >> "$config"

# Writing the functions script
echo "#!/bin/bash" > "$functions"
echo "" >> "$functions"
echo "# Function to read submissions file and output students who have not submitted" >> "$functions"
echo "function check_submissions {" >> "$functions"
echo "    local submissions_file=\$1" >> "$functions"
echo "    echo \"Checking submissions in \$submissions_file\"" >> "$functions"
echo "" >> "$functions"
echo "    # Skip the header and iterate through the lines" >> "$functions"
echo "    while IFS=, read -r student assignment status; do" >> "$functions"
echo "        # Remove leading and trailing whitespace" >> "$functions"
echo "        student=\$(echo \"\$student\" | xargs)" >> "$functions"
echo "        assignment=\$(echo \"\$assignment\" | xargs)" >> "$functions"
echo "        status=\$(echo \"\$status\" | xargs)" >> "$functions"
echo "" >> "$functions"
echo "        # Check if assignment matches and status is 'not submitted'" >> "$functions"
echo "        if [[ \"\$assignment\" == \"\$ASSIGNMENT\" && \"\$status\" == \"not submitted\" ]]; then" >> "$functions"
echo "            echo \"Reminder: \$student has not submitted the \$ASSIGNMENT assignment!\"" >> "$functions"
echo "        fi" >> "$functions"
echo "    done < <(tail -n +2 \"\$submissions_file\") # Skip the header" >> "$functions"
echo "}" >> "$functions"

# Writing the startup script
echo "#!/bin/bash" > "$startup"
echo "bash ./app/reminder.sh" >> "$startup"

# Making startup.sh executable
chmod +x "$startup"

echo "Environment setup complete."

