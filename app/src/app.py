from flask import Flask, jsonify
import os
import socket
import logging

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "OpenShift Enterprise Platform")
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")

@app.route("/")
def home():
    return jsonify({
        "application": APP_NAME,
        "version": APP_VERSION,
        "hostname": socket.gethostname(),
        "status": "Running"
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "UP"
    })

@app.route("/ready")
def ready():
    return jsonify({
        "ready": True
    })

@app.route("/metrics")
def metrics():
    return jsonify({
        "requests": 100,
        "uptime": "Healthy"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)