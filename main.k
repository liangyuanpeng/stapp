schema Compose:
    version?: str
    services: {str: Service}

schema Service:
    image: str 
    restart?: str 
    entrypoint?: str 
    command?: [str]
    network_mode?: str 
    volumes?: [str]
    entrypoint?: str

_services={}

_services=services = {
    "etcd{}".format(x) = {
        image = "quay.io/coreos/etcd:v3.6.0-rc.0"
    } for x in range(0,option("count",default=5))
}

# quay.io/coreos/etcd:v3.6.0-rc.0
# ghcr.io/liangyuanpeng/etcd:main-0-linux-amd64
# ghcr.io/xline-kv/xline:latest
# registry.k8s.io/etcd:3.5.6-0

Compose{
    services=_services
}
