
if [ ! -f xenial.qcow2 ]; then
    curl -o xenial.qcow2 https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img
    qemu-img resize xenial.qcow2 +15G
fi
