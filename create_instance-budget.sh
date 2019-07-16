. ./env.sh

# budget: 'type=nvidia-tesla-k80,count=1'
gcloud compute instances create $INSTANCE_NAME \
        --verbosity=info \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-k80,count=1" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
        --metadata-from-file startup-script=vm_post_prov.sh \
        --preemptible

# --metadata-from-file startup-script=examples/scripts/install.sh \

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

gcloud compute ssh jupyter@$INSTANCE_NAME --zone=$ZONE -- -N -L 8080:localhost:8080 &

echo
echo "CONNECT: gcloud compute ssh jupyter@$INSTANCE_NAME --zone=$ZONE -- -L 8080:localhost:8080"
echo
echo "DELETE : gcloud compute instances delete $INSTANCE_NAME --zone=$ZONE --quiet"
echo

