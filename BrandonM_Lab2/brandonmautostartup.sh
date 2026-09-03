#!/bin/bash

# check for newer versions of the software packages installed on this server and update them
# "-y" means automatically answer yes for automation purposes
dnf update -y

# install the Apache HTTP server
dnf install -y httpd

# start Apache
systemctl start httpd

# start Apache automatically whenever the Linux machine boots
systemctl enable httpd

# create the website's image directory
# "-p" create any parent directories that don't already exist
# "/var/www/html/images" is where Apache serves website files from by default on Amazon Linux
mkdir -p /var/www/html/images

cat > /var/www/html/index.html <<'EOF'

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My EC2 Website</title>

    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <header>
        <h1>Welcome to My EC2 Website</h1>
        <p>Hosted automatically using AWS EC2 User Data</p>
    </header>


    <main>

        <section id="about">
            <h2>About Me</h2>

            <p>
                Hello! My name is Brandon.
                I am learning cloud computing, Linux,
                automation, and AWS.
            </p>

            <img src="images/profile.jpg"
                 alt="Profile image">
        </section>


        <section id="projects">
            <h2>Project Description</h2>

            <p>
                My name is Brandon Morse and this website was 
                created as part of an AWS EC2
                automation lab. The EC2 instance automatically
                installs Apache and creates this website using
                a Bash startup script.
            </p>

            <p>
                The purpose of this project is to demonstrate
                cloud initialization, Linux directory management,
                Bash scripting, and web server configuration.
            </p>
        </section>


        <section id="contact">
            <h2>Contact</h2>

            <p>
                Thank you for visiting my website! Brandon btw!
            </p>
        </section>

    </main>


    <footer>
        <p>&copy; 2026 Brandon - EC2 Automation Lab</p>
    </footer>

</body>

</html>
EOF

cat > /var/www/html/styles.css << 'EOF'

body {
    font-family: Arial, sans-serif;
    background-color: #e8f1f8;
    color: #222;
    margin: 0;
    padding: 0;
}

header {
    background-color: #1f4e79;
    color: white;
    text-align: center;
    padding: 40px;
}

main {
    width: 80%;
    max-width: 900px;
    margin: 30px auto;
}

section {
    background-color: white;
    margin-bottom: 25px;
    padding: 25px;
    border-radius: 10px;
}

section img {
    width: 200px;
    display: block;
    margin-top: 15px;
}

footer {
    background-color: #1f4e79;
    color: white;
    text-align: center;
    padding: 20px;
}
EOF

# create a placeholder image file and download a small sample image for the website
curl -L \
    "https://placehold.co/400x300.jpg" \
    -o /var/www/html/images/profile.jpg

mkdir -p /home/ec2-user/backups/web_backup

cp /var/www/html/index.html \
   /home/ec2-user/backups/web_backup/

cp /var/www/html/styles.css \
   /home/ec2-user/backups/web_backup/

cp /var/www/html/images/profile.jpg \
   /home/ec2-user/backups/web_backup/

mkdir -p /home/ec2-user/log-archive

touch /home/ec2-user/log-archive/log1.txt
touch /home/ec2-user/log-archive/log2.txt
touch /home/ec2-user/log-archive/log3.txt
touch /home/ec2-user/log-archive/log4.txt

echo "Log archive file 1" > /home/ec2-user/log-archive/log1.txt
echo "Log archive file 2" > /home/ec2-user/log-archive/log2.txt
echo "Log archive file 3" > /home/ec2-user/log-archive/log3.txt
echo "Log archive file 4" > /home/ec2-user/log-archive/log4.txt

mkdir -p /home/ec2-user/content
mkdir -p /home/ec2-user/utils
mkdir -p /home/ec2-user/credentials

echo "Content directory placeholder" \
    > /home/ec2-user/content/README.txt

echo "Utils directory placeholder" \
    > /home/ec2-user/utils/README.txt

echo "Credentials directory placeholder" \
    > /home/ec2-user/credentials/README.txt

chown -R apache:apache /var/www/html

systemctl restart httpd

echo "EC2 startup script completed successfully!"