variable "google_credentials" {
  description = "계정 자격 증명을 설명하는 데 사용되는 JSON 파일의 경로"
}

variable "google_project_id" {
  description = "구글 클라우드 프로젝트의 ID"
}

variable "cluster_name" {
  default = "cluster-1"
  description = "프로비저닝 할 클러스터의 이름입니다."
}

variable "initial_node_count" {
  description = "클러스터에 노드수."
  default = 3
}

variable region {
  description = "리전"
  default = "asia-northeast1"
}

variable zone {
  description = "리전 영역"
  default = "asia-northeast1-a"
}

variable "network" {
  type = string
  default = "default"
  description = "- (옵션) Compute Engine 네트워크의 이름 또는 self_link입니다."
}

variable "subnetwork" {
  type = string
  default = "default"
  description = "- (옵션) Compute Engine 서브 네트워크의 이름 또는 self_link입니다."
}

variable "machine_type" {
  description = "클러스터의 각 노드에 대해 실행할 컴퓨팅 인스턴스의 머신 유형입니다."
  default     = "e2-medium"
}

variable "kubernetes_version" {
  description = "Kubernetes 버전입니다. 'latest'으로 설정하면 선택한 리전에서 사용 가능한 최신 버전을 가져옵니다."
  type        = string
  default     = "latest"
}
