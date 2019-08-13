PROFILE=${1:-fastai}

[ -e profiles/${PROFILE}.conf ] || exit 1

. profiles/${PROFILE}.conf

INSTANCE_NAME=${INSTANCE_NAME:=my-instance}
#ZONE=${ZONE:=us-west1-b}
ZONE=${ZONE:=europe-west1-b}

gcloud compute instances delete ${INSTANCE_NAME} \
        --verbosity=${VERBOSITY:=info} \
        --zone=${ZONE}
