module "gke" {
    source  = "./gke"
    cluster_name = "gke-dev-1"
    google_project_id = "eco-droplet-277306"
    region = "asia-northeast3"
    zone = "asia-northeast3-a"
    initial_node_count = 1
    google_credentials = "./credentials.json"
}