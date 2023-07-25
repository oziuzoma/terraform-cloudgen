resource "helm_release" "calico" {
  name             = "calico"
  repository       = "https://projectcalico.docs.tigera.io/charts"
  chart            = "tigera-operator"
  namespace        = "tigera-operator"
  create_namespace = true
  cleanup_on_fail  = true         

  set {
    name  = "kubernetesProvider"
    value = "EKS"
  }
}

resource "helm_release" "wordpress" {
  name             = "wordpress"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "wordpress"
  namespace        = "wordpress"
  create_namespace = true
  cleanup_on_fail  = true 
  depends_on = [helm_release.calico]
} 


