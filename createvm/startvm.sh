QEMU=/usr/libexec/qemu-kvm
start_net() {
        echo "start network adapter tap0"
	sudo ip tuntap add dev tap0 mode tap
	sudo ip link set dev tap0 master space-br0
	sudo ip link set tap0 up
}
start_net

#-serial file:output.log \

$QEMU -name space -smp 8 -hda xenial.qcow2 -hdb user-data -vnc :1 -m 8192 \
-net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no \
-serial stdio
