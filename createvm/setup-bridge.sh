
NIC=${1:-eno1}
IP_ADDR=`ip addr show $NIC |grep "inet "|awk '{print $2}'`
#IP_ADDR=`ip addr show $NIC |grep "inet "|cut -d/ -f1 |awk '{print $2}'`
echo $NIC $IP_ADDR

ip link show space-br0
if [ $? -ne 0 ];then
    sudo ip link add name space-br0 type bridge
    sudo ip link set dev $NIC promisc on
    sudo ip link set dev $NIC master space-br0
    sudo ip address add $IP_ADDR dev space-br0
    sudo ip address del $IP_ADDR dev $NIC
    sudo ip link set space-br0 up
fi

