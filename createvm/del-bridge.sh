
NIC=${1:-eno1}
IP_ADDR=`ip addr show space-br0 |grep "inet "|awk '{print $2}'`
#IP_ADDR=`ip addr show $NIC |grep "inet "|cut -d/ -f1 |awk '{print $2}'`
echo $NIC $IP_ADDR

ip link show space-br0
if [ $? -eq 0 ];then
    sudo ip link del dev space-br0
    sudo ip address add $IP_ADDR dev $NIC
fi

