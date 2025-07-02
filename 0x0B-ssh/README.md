# SSH Key-Based Authentication Setup

A simple guide to configure SSH to connect to a remote server without a password, using a private key.

### Requirements
A Linux/Unix-based system (local machine & server).

ssh-keygen installed (usually included by default).

Access to the remote server (ubuntu@<IP>).

Steps
1. Generate an SSH Key Pair
Run this on your local machine:

    bash
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/school -N "betty"
    Creates:

    Private key: ~/.ssh/school

    Public key: ~/.ssh/school.pub

2. Copy the Public Key to the Server
    bash
    ssh-copy-id -i ~/.ssh/school.pub user@<server-ip>
    (If ssh-copy-id fails, manually append school.pub to ~/.ssh/authorized_keys on the server.)

3. Configure SSH Client (Optional)
    Edit ~/.ssh/config for easier access:

    ini
    Host myserver  
        HostName <server-ip>  
        User ubuntu  
        IdentityFile ~/.ssh/school  
        PasswordAuthentication no  
    Now, just run:

    bash
    ssh myserver
4. Disable Password Login (Server-Side)
    On the remote server, edit /etc/ssh/sshd_config:

    ini
    PubkeyAuthentication yes  
    PasswordAuthentication no  
    Then restart SSH:

    bash
    sudo systemctl restart sshd
    Troubleshooting
    "Permission denied (publickey)"?

    Verify ~/.ssh/school permissions (chmod 600 ~/.ssh/school).

    Check /var/log/auth.log on the server for errors.

    Firewall issues?
    Ensure port 22 is open:

    bash
    sudo ufw allow 22  # Ubuntu
    Example Connection
    bash
    ssh -i ~/.ssh/school user@<server-ip>