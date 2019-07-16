# gcp-env
Some scripts and stuff I used from GCP Cloud Shell

Clone into your Google Cloud Shell home.

### Script

The script `./create_instance.sh` will do the following:
- create a GCP Instance (VM)
- run a post-provisioning script, which can download some git repositories for example
- wait for SSH port to be up
- open an SSH tunnel to provide access to Jupyter notebook via the "Preview on Port 8080" option right within Cloud Shell.

### How to run

- Default: create a fastai instance, with PyTorch installed:

```
./create_instance.sh [fastai]
```

- Ageron profile: create a Tensorflow instance, and download some tensorflow training repositories:

```
./create_instance.sh ageron
```

