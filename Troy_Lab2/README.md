# CPG_Capstone_Group_Lab2

# Explanation of the script logic:

The Bash startup script is designed to automatically configure an Amazon EC2 instance when it launches. First, the script updates the system packages and installs the Apache web server. Apache is then enabled and started so that the web server runs automatically.

The script creates an HTML file named index.html and a separate CSS file named style.css in /var/www/html. The HTML page contains my name, a background color, an embedded image, and three content sections: About Me, Project Description, and Contact/Footer.

The script also creates a backup directory at /var/www/backup and copies the generated website files into it. A log archive directory is created at /var/log/archive, along with four dummy log files.

Additional directories named content, utils, and credentials are created inside the web directory. Each directory contains a placeholder file. Finally, Apache is restarted to ensure that the newly created website is available over HTTP.

After the EC2 instance launches, Linux commands such as find, ls, systemctl status, and curl can be used through EC2 Instance Connect to verify that the web server, website files, backup files, archive files, and required directories were created successfully.


# What the Script Creates:

File structure:

/var/www/html/
├── index.html
├── style.css
├── content/
│   └── placeholder.txt
├── utils/
│   └── placeholder.txt
└── credentials/
    └── placeholder.txt

/var/www/backup/
├── index.html.bak
├── style.css.bak
└── startup.sh.bak

/var/log/archive/
├── archive1.log
├── archive2.log
├── archive3.log
└── archive4.log
