# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/ubuntu-14.04"
  config.omnibus.chef_version = :latest

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, host: 3000, guest: 3000 # open up port 3000 so rails server works as expected

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "private_network", ip: "33.33.33.11" # ip for your postgresql instance so you can connect to it locally

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "[local_dir]", "[vagrant_dir]", :nfs => true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    #vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "3072"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.cpus = 4
  end

  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with CFEngine. CFEngine Community packages are
  # automatically installed. For example, configure the host as a
  # policy server and optionally a policy file to run:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.am_policy_hub = true
  #   # cf.run_file = "motd.cf"
  # end
  #
  # You can also configure and bootstrap a client to an existing
  # policy server:
  #
  # config.vm.provision "cfengine" do |cf|
  #   cf.policy_server_address = "10.0.2.15"
  # end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks" # path to your cookbooks
    chef.data_bags_path = "data_bags" # path to your data_bags

    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "chef_handler"
    chef.add_recipe "git"
    chef.add_recipe "git::source"
    chef.add_recipe "chef-solo-search"
    chef.add_recipe "openssl"
    chef.add_recipe "sysctl"
    chef.add_recipe "ohai"
    chef.add_recipe "vim"
    chef.add_recipe "zsh"
    chef.add_recipe "oh-my-zsh"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::libpq"
    chef.add_recipe "java"
    chef.add_recipe "chef-xvfb"
    chef.add_recipe "zip"
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::user"
    chef.add_recipe "rvm::gem_package"
    chef.add_recipe "libmagic"
    chef.add_recipe "memcached"
    chef.add_recipe "chef-firefox"

    chef.json = {
      oh_my_zsh: {
        users: [
          {
            login: 'vagrant',
            theme: 'af-magic',
            plugins: [
              'git',
              'vi-mode',
              'rails',
              'ruby',
              'bundler',
              'virtualenv',
            ]
          },
        ],
      },
      "postgresql" => {
        "users" => [
          "username" => "vagrant",
          "password" => "vagrant",
          "superuser" => true,
          "createdb" => true,
          "login" => true,
        ],
        "pg_hba" => [
          {
            "type"    => "host",
            "db"      => "all",
            "user"    => "all",
            "addr"    => "0.0.0.0/0",
            "method"  => "md5",
          },
        ],
        'listen_addresses' => '*',
      },
      "rvm" => {
        "rubies" => [
          'ruby-2.1.1',
          'ruby-2.1.2',
        ],
        "default_ruby" => "ruby-2.1.2",
        "global_gems" => [
          {
            'name' => 'bundler',
          },
        ],
        'user_installs' => [
          {
            'user'          => 'vagrant',
            'default_ruby'  => 'ruby-2.1.2',
            "rubies" => [
              'ruby-2.1.1',
              'ruby-2.1.2',
            ],
            "global_gems" => [
              {
                'name' => 'bundler',
              },
            ],
          },
        ],
      },
    }
  end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
