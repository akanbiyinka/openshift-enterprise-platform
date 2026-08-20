from kubernetes import client, config


def load_kube():

    try:
        config.load_incluster_config()
    except:
        config.load_kube_config()


def get_cluster_data():

    load_kube()

    v1 = client.CoreV1Api()

    pods = v1.list_namespaced_pod(
        namespace="openshift-enterprise-platform"
    )

    pod_data = []

    for pod in pods.items:

        pod_data.append(
            {
                "name": pod.metadata.name,
                "status": pod.status.phase
            }
        )

    return pod_data
from kubernetes import client, config


def load_cluster():

    try:
        config.load_incluster_config()
    except:
        config.load_kube_config()


def get_cluster_data():

    load_cluster()

    v1 = client.CoreV1Api()
    apps = client.AppsV1Api()
    autoscale = client.AutoscalingV2Api()


    nodes = v1.list_node()

    pods = v1.list_namespaced_pod(
        namespace="openshift-enterprise-platform"
    )

    deployments = apps.list_namespaced_deployment(
        namespace="openshift-enterprise-platform"
    )

    hpa = autoscale.list_namespaced_horizontal_pod_autoscaler(
        namespace="openshift-enterprise-platform"
    )


    return {
        "nodes": len(nodes.items),
        "pods": len(pods.items),
        "deployments": len(deployments.items),
        "hpa": len(hpa.items)
    }
