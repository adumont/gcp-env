# gcp-env
Some scripts and stuff I used from within [GCP Cloud Shell](https://console.cloud.google.com/cloudshell/editor?shellonly=true)

Clone into your Google Cloud Shell home.

Install with:

```
curl https://raw.githubusercontent.com/adumont/gcp-env/master/install.sh | bash
```

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


### References

- GCP Images: https://cloud.google.com/deep-learning-vm/docs/images
- GPUs con Compute Engine (info of what GPUs are available where): https://cloud.google.com/compute/docs/gpus/
