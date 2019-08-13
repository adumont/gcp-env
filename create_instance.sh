PROFILE=${1:-fastai}

[ -e profiles/${PROFILE}.conf ] || exit 1

. profiles/${PROFILE}.conf

INSTANCE_NAME=${INSTANCE_NAME:=my-instance}
#ZONE=${ZONE:=us-west1-b}
ZONE=${ZONE:=europe-west1-b}

gcloud compute instances create ${INSTANCE_NAME} \
        --verbosity=${VERBOSITY:=info} \
        --zone=${ZONE} \
        --image-family=${IMAGE_FAMILY:=pytorch-latest-gpu} \
        --image-project=${IMAGE_PROJECT:=deeplearning-platform-release} \
        --maintenance-policy=TERMINATE \
        --accelerator=${ACCELERATOR:="type=nvidia-tesla-k80,count=1"} \
        --machine-type=${MACHINE_TYPE:=n1-highmem-4} \
        --boot-disk-size=${BOOT_DISK_SIZE:=200GB} \
        --metadata="${METADATA:=install-nvidia-driver=True}" \
        --metadata-from-file startup-script=profiles/${PROFILE}.sh \
        --preemptible

# gcloud compute instances list

IP=$( gcloud compute instances list --filter="$INSTANCE_NAME" | grep -v PREEMPTIBLE | awk '{ print $6 }' )

if ! which nc >/dev/null
then
   sudo apt update -qqq &>/dev/null
   sudo apt install netcat -qqq -y &>/dev/null
fi

echo -n "Waiting for ssh port to be up"
until nc -w 1 -z ${IP} 22
do
   echo -n "."; sleep 5
done
echo

echo "Opening tunnel for Jupyter Notebook. Use Web Preview to connect. "

gcloud compute ssh jupyter@$INSTANCE_NAME --zone=$ZONE -- -N -L 8080:localhost:${LOCAL_PORT:=8080} &

echo
echo "CONNECT: gcloud compute ssh jupyter@$INSTANCE_NAME --zone=$ZONE -- -L 8080:localhost:${LOCAL_PORT:=8080}"
echo
echo "DELETE : gcloud compute instances delete $INSTANCE_NAME --zone=$ZONE --quiet"
echo
