resource "kubectl_manifest" "karpenter_provisioner" {
  yaml_body = <<YAML
  apiVersion: karpenter.sh/v1alpha5
  kind: Provisioner
  metadata:
    name: default
  spec:
    provider:
      subnetSelector:
        kubernetes.io/cluster/demoeks-cluster: "owned"
      securityGroupSelector:
        kubernetes.io/cluster/demoeks-cluster: "owned"
    ttlSecondsAfterEmpty: 30
  YAML
  depends_on = [module.karpenter]
}