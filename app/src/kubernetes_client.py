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
