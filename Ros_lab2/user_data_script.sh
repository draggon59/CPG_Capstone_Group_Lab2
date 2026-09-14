#!/bin/bash

# ==========================================
# EC2 Startup Script
# Installs Apache and creates website/files
# ==========================================

# Update installed packages
dnf update -y

# ------------------------------------------
# 1. Install Apache web server
# ------------------------------------------
dnf install -y httpd

# Enable Apache to start automatically
systemctl enable httpd

# Start Apache
systemctl start httpd

# ------------------------------------------
# 2. Create website directories
# ------------------------------------------

WEB_DIR="/var/www/html"
BACKUP_DIR="/var/www/backup"
LOG_ARCHIVE_DIR="/var/log/archive"

mkdir -p "$WEB_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_ARCHIVE_DIR"

# Additional required directories
mkdir -p "$WEB_DIR/content"
mkdir -p "$WEB_DIR/utils"
mkdir -p "$WEB_DIR/credentials"

# ------------------------------------------
# 3. Create HTML file
# ------------------------------------------

cat > "$WEB_DIR/index.html" <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ros Lab#2 EC2 Web Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <header>
        <h1>Welcome to Ros's Lab#2 EC2 Website</h1>
        <p>Demonstrating User Data Automation on Amazon EC2 using Apache</p>
    </header>

    <section id="about">
        <h2>My Introduction</h2>
        <p>
            My name is Ros. I am grateful to have joined Theo's classes, I aspire to become a Platform Engineer at the end of my studies
            and generate enough income to to become a Commercial Real Estate owner in the future.
        </p>

        <img
            src="https://raw.githubusercontent.com/draggon59/CPG_Capstone_Group_Lab2/refs/heads/main/Ros_lab2/image/images.jpeg"
            alt="Cloud computing"
        >
    </section>

    <section id="project">
        <h2>CPG Lab#2 Description</h2>
        <p>
            This is the EC2 automation lab2.
        </p>
    </section>

    <section id="contact">
        <h2>Contact / Footer</h2>
        <p>Email: cpg_fundamentals@example.com</p>
        <p>Thank you for visiting my EC2 website!</p>
    </section>

    <footer>
        <p>&copy; 2026 Ros's EC2 Bash scripting Lab#2</p>
    </footer>

</body>
</html>
EOF

# ------------------------------------------
# 4. Create separate CSS file
# ------------------------------------------

cat > "$WEB_DIR/style.css" <<'EOF'
body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    background-color: #eaf4f4;
    color: #222;
}

header {
    background-color: #12355b;
    color: white;
    text-align: center;
    padding: 40px 20px;
}

section {
    background-color: white;
    margin: 30px auto;
    padding: 30px;
    max-width: 900px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
}

h2 {
    color: #12355b;
}

img {
    display: block;
    width: 100%;
    max-width: 700px;
    margin: 20px auto;
    border-radius: 10px;
}

footer {
    background-color: #12355b;
    color: white;
    text-align: center;
    padding: 20px;
}
EOF

# ------------------------------------------
# 5. Create backup of generated website files
# ------------------------------------------

cp "$WEB_DIR/index.html" "$BACKUP_DIR/index.html.bak"
cp "$WEB_DIR/style.css" "$BACKUP_DIR/style.css.bak"

# ------------------------------------------
# 6. Create four dummy archive files
# ------------------------------------------

touch "$LOG_ARCHIVE_DIR/archive1.log"
touch "$LOG_ARCHIVE_DIR/archive2.log"
touch "$LOG_ARCHIVE_DIR/archive3.log"
touch "$LOG_ARCHIVE_DIR/archive4.log"

# Put some content into the dummy files
echo "Dummy archive file 1" > "$LOG_ARCHIVE_DIR/archive1.log"
echo "Dummy archive file 2" > "$LOG_ARCHIVE_DIR/archive2.log"
echo "Dummy archive file 3" > "$LOG_ARCHIVE_DIR/archive3.log"
echo "Dummy archive file 4" > "$LOG_ARCHIVE_DIR/archive4.log"

# ------------------------------------------
# 7. Create placeholder files
# ------------------------------------------

touch "$WEB_DIR/content/placeholder.txt"
touch "$WEB_DIR/utils/placeholder.txt"
touch "$WEB_DIR/credentials/placeholder.txt"

echo "Content placeholder" > "$WEB_DIR/content/placeholder.txt"
echo "Utils placeholder" > "$WEB_DIR/utils/placeholder.txt"
echo "Credentials placeholder" > "$WEB_DIR/credentials/placeholder.txt"

# ------------------------------------------
# 8. Create a copy of the startup script
# ------------------------------------------

cp /var/lib/cloud/instance/scripts/part-001 "$BACKUP_DIR/startup.sh.bak" 2>/dev/null || true

# ------------------------------------------
# 9. Set permissions
# ------------------------------------------

chmod 644 "$WEB_DIR/index.html"
chmod 644 "$WEB_DIR/style.css"

# ------------------------------------------
# 10. Restart Apache
# ------------------------------------------

systemctl restart httpd

# ------------------------------------------
# Finished
# ------------------------------------------

echo "Lab#2 EC2 startup script completed successfully."