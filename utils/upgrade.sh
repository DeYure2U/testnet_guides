#!/bin/bash
source <(curl -s https://raw.githubusercontent.com/itrocket-team/testnet_guides/main/utils/common.sh)

#while getopts u:v:n:i:b:h:p: flag; do
  #case "${flag}" in
  #u) UPD_HEIGHT=$OPTARG ;;
  #v) VERSION=$OPTARG ;;
  #n) CHAIN_NAME=$OPTARG ;;
  #i) CHAIN_ID=$OPTARG ;;
  #b) BINARY=$OPTARG ;;
  #h) PROJECT_HOME=$OPTARG ;;
  #p) PORT_RPC=$OPTARG ;;
  #*) echo "WARN: unknown parameter: ${OPTARG}"
  #esac
#done

printLogo

echo -e "$GREEN NODE WILL BE UPDATED AT BLOCK: $HEIGHT TO VERSION: $VER ON \n"
for((;;)); do
	height=$(${BINARY} status |& jq -r .SyncInfo.latest_block_height)
	if ((height>=$UPD_HEIGHT)); then

		sudo systemctl stop ${BINARY}
		cd $HOME
		sudo systemctl restart ${BINARY}
			sleep 1
		done
		height=$(${BINARY} status |& jq -r .SyncInfo.latest_block_height)
		if ((height>$UPD_HEIGHT)); then
			echo -e "$GREEN_COLOR NODE WAS SUCCESFULLY UPDATED TO $VERSION \n"
		fi
		${BINARY} version --long | head
		break
	else
		echo -e "${GREEN_COLOR}$height ($(( BLOCK - height  )) blocks left)"
	fi
	sleep 5
done
