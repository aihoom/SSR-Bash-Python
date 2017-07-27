#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

echo "测试区域，请勿随意使用"
echo "1.一键封禁BT下载，SPAM邮件流量（无法撤销）"
echo "2.防止暴力破解SS连接信息 (重启后失效)"

while :; do echo
	read -p "请选择： " devc
	[ -z "$devc" ] && ssr && break
	if [[ ! $devc =~ ^[1-2]$ ]]; then
		echo "输入错误! 请输入正确的数字!"
	else
		break	
	fi
done

if [[ $devc == 1 ]];then
	wget -4qO- softs.pw/Bash/Get_Out_Spam.sh|bash
fi

if [[ $devc == 2 ]];then
	nohup tail -F /usr/local/shadowsocksr/ssserver.log | python autoban.py >log 2>log &
fi