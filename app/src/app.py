from flask import Flask, render_template, jsonify
from kubernetes_client import get_cluster_data
import socket


app = Flask(__name__)


@app.route("/")
def dashboard():

    pods = get_cluster_data()

    running = len(
        [
            p for p in pods
            if p["status"] == "Running"
        ]
    )

    return render_template(
        "index.html",
        pods=pods,
        running=running,
        hostname=socket.gethostname()
    )


@app.route("/health")
def health():

    return jsonify(
        {
            "status":"healthy"
        }
    )


@app.route("/ready")
def ready():

    return jsonify(
        {
            "status":"ready"
        }
    )


if __name__ == "__main__":

    app.run(
        host="0.0.0.0",
        port=8080
    )
