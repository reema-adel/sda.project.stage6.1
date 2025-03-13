#!/bin/bash

# Navigate to project directory
cd /home/azureuser/stage6

# Activate virtual environment
source env/bin/activate

# Stop any existing processes on these ports
sudo lsof -i :8000 -t | xargs -r sudo kill -9
sudo lsof -i :5000 -t | xargs -r sudo kill -9
sudo lsof -i :8501 -t | xargs -r sudo kill -9

# Start ChromaDB
nohup chroma run --host localhost --port 8000 >> logs/chromadb.log 2>&1 &

# Start FastAPI
nohup uvicorn backend:app --host 0.0.0.0 --port 5000 >> logs/fastapi.log 2>&1 &

# Start Streamlit
nohup streamlit run app.py --server.port 8501 --server.address 0.0.0.0 >> logs/streamlit.log 2>&1 &

echo "Deployment completed. Check logs in ~/stage4/logs/"