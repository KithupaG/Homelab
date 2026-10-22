# First Deployment

1. First I installed K3S cluster through the `curl -sfL https://get.k3s.io | sh -` command
2. Checked the status of K3S service using `systemctl status k3s`
3. Then I created a .kube directory the my userhome and copied over the k3s.yaml over to the new .kube/config path I had created.
4. Adjusted the file ownership so that I can run kubectl commands without using sudo everytimeusing `sudo chown $(id -u):$(id -g) ~/.kube/config`
5. Finally, tested if everything works using the command `kubectl get nodes
6. However, after testing if everythings works using step 5, I realised I still needed to use sudo to use kubectl, so I went ahead and modified the `.bashrc` file in `~/` and added the environment variable for KUBECONFIG, the exact line :- `export KUBECONFIG=~/.kube/config`, I applied this script at the very bottom of the .bashrc file
7. After that I ran the command source ~/.bashrc which ran the bash file
