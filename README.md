# submission_reminder_app_AHIRWE1

          Submission Reminder Application.

This is a basic appliction that alerts students about upcoming assignment deadlines.
The setup script automates the creationof necessary files and directories.

         Installation and setup

Step1. To setup environment, run the following commands in your terminal:

  bash create_environment.sh

Output: > create necessary directories and files
        > populates files their contents
        > set executable permissions for shell scripts

Step2. After setup, start the application by running:

  bash submission_reminder_Gabriella_Ahirwe/startup

Output: > load anvironment configurations
        > check the submissions.txt file for students who didn't submit their assignments
        > Displays reminders accordingly


        File structure

submission_reminder_Gabriella_Ahirwe/
│-- app/
│   ├── reminder.sh
│-- modules/
│   ├── functions.sh
│-- assets/
│   ├── submissions.txt
│-- config/
│   ├── config.env
│-- startup.sh

         Configuration

The assignment details and submission deadline are stored in config.env file
You can modify submissions.txt file to update submission statuses

Remember to make all .sh files executable
