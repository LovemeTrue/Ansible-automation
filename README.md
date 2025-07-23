## Ansible repo for auto deploy multinode cluster using Deckhouse.

## Project structure:
```
├── cleanup_static_node.sh
├── group_vars
│   ├── all
│   │   └── s3-secrets.yml
│   └── all.yml
├── playbooks
│   ├── add-enpoints.yml
│   ├── add-nodegroup.yml
│   ├── add-pyroscope.yml
│   ├── add-pyrsocope-svc.yml
│   ├── another.yml
│   ├── argo-deploy.yml
│   ├── base-setting-up.yml
│   ├── cleanup_static_node.sh
│   ├── cleanup-static-nodes.yml
│   ├── config.yml
│   ├── install-deckhouse.yml
│   ├── install-dependencies.yml
│   ├── inventory
│   │   ├── add-nodes-inventory.yml
│   │   └── inventory.yml
│   ├── templates
│   │   ├── config.yml.j2
│   │   ├── ingress-nginx-controller.yml.j2
│   │   ├── kubectl patch node k8s-system-n1 --type=.json
│   │   ├── master-k8s-config.yml.j2
│   │   ├── nodegroup-system.yaml.j2
│   │   ├── nodegroup-worker.yaml.j2
│   │   ├── pyroscope-datasource.yml.j2
│   │   ├── pyroscope-svc-values.yml.j2
│   │   ├── pyroscope-values.yml.j2
│   │   └── user.yml.j2
│   └── uninstall-deckhouse.yml
├── requirements.txt
├── tasks
│   ├── docker-debian.yml
│   └── docker-ubuntu.yml
└── vault.yml
```

## Requirements
ansible>=7.0
kubernetes>=25.0
jmespath
