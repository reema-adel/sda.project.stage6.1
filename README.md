How to Reload, Start, and Check Status of Services
This guide provides the steps to reload the systemd configuration, start the services, and check their status for the ChromaDB, FastAPI (backend), and Streamlit (frontend) services running in /home/azureuser/stage6.

1. Reload Systemd Configuration
After modifying any service files (e.g., /etc/systemd/system/backend.service), reload the systemd daemon to apply the changes.

sudo systemctl daemon-reload