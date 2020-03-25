Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64" #Ubuntu boxes https://app.vagrantup.com/ubuntu
  config.vm.provision "shell", inline: "adduser --disabled-password --gecos '' jllado; true"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "jllado_kubernetes_playbook.yml"
  end
end
