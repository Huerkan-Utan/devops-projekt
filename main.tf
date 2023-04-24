# es gibt kleine anderen Provider sollte ich doch evtl Vagrant benutzen?!!

# --------------------------------------
#
#
# the Terraform configuration is not working as the Provider versions are outdated !! 
# using vagrant instead
#
#
# Error: Could not retrieve the list of available versions for provider terra-farm/virtualbox: no available releases match the given constraints 0.2.1
#
#
#
#---------------------------------------
terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.1"
    }
  }
}

# There are currently no configuration options for the provider itself.

resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}