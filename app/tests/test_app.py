from unittest.mock import patch
from src.app import app


MOCK_CLUSTER_DATA = {
    "nodes": 1,
    "pods": {
        "running": 2,
        "total": 2
    },
    "deployments": 1,
    "services": 1,
    "hpa": 1
}


@patch("src.app.get_cluster_data")
def test_home(mock_get_cluster_data):
    mock_get_cluster_data.return_value = MOCK_CLUSTER_DATA

    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200


def test_health():
    client = app.test_client()

    response = client.get("/health")

    assert response.status_code == 200


def test_ready():
    client = app.test_client()

    response = client.get("/ready")

    assert response.status_code == 200
