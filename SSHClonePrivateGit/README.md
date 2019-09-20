# SSHClonePrivateGit
SSHClonePrivateGit

## Git cloning python code from a private git repo using SSH key

```console
docker build --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa_no_passphrase)" --tag ssh-clone-private-git .

docker run -it --rm ssh-clone-private-git

```

