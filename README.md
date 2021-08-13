<h1 align="center">Terraform - AWS EKS</h1>
Strategy on how to create a k8s cluster in aws AWS EKS

## Dependencies
- [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Kubctl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Install modules
```
  terraform init
```

## Create cluster
```
  terraform apply --auto-approve
```

## Create context file
```
  aws eks --region us-east-1 update-kubeconfig --name my-cluster
```

## Destroy
```
  terraform destroy
```

## Get nodes
```
  kubctl get nodes
```

## Author
- Harrisson Ricardo Biaggio

## References
[Canal do Fidelis](https://www.youtube.com/c/MatheusFidelissauro/videos)
