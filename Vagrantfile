# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :servidorWeb do |servidorWeb|
    servidorWeb.vm.box = "bento/ubuntu-22.04"
    servidorWeb.vm.network :private_network, ip: "192.168.80.3"
    servidorWeb.vm.synced_folder "../dockerAPIREST_consulCompose", "/home/vagrant/dockerAPIREST"
    servidorWeb.vm.hostname = "servidorWeb"
  end
end