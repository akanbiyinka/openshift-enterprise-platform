from flask import Flask, render_template, jsonify
from kubernetes_client import get_cluster_data


app = Flask(__name__)


@app.route("/")
def dashboard():

    data = get_cluster_data()

    return render_template(
        "index.html",
        data=data
    )


@app.route("/api/cluster")
def cluster():

    return jsonify(
        get_cluster_data()
    )


@app.route("/health")
def health():

    return {
        "status":"healthy"
    }


@app.route("/ready")
def ready():

    return {
        "status":"ready"
    }


if __name__ == "__main__":

    app.run(
        host="0.0.0.0",
        port=8080
    )
