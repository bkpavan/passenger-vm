# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"
  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'redis'
    chef.add_recipe 'apache2'
    chef.add_recipe 'git'
    chef.add_recipe 'rvm'
    chef.add_recipe 'mysql::server'
    chef.json = {
      :redis  => {
        :bind        => "127.0.0.1",
        :port        => "6379",
        :config_path => "/etc/redis/redis.conf",
        :daemonize   => "yes",
        :timeout     => "300",
        :loglevel    => "notice"
      },
      :apache => {
        :dir               => "/etc/apache2",
        :log_dir           => "/var/log/apache2",
        :error_log         => "error.log",
        :user              => "www-data",
        :group             => "www-data",
        :binary            => "/usr/sbin/apache2",
        :cache_dir         => "/var/cache/apache2",
        :pid_file          => "/var/run/apache2.pid",
        :lib_dir           => "/usr/lib/apache2",
        :listen_ports      => [
          "80"
        ],
        :contact           => "ops@example.com",
        :timeout           => "300",
        :keepalive         => "On",
        :keepaliverequests => "100",
        :keepalivetimeout  => "5"
      },
      :git    => {
        :prefix => "/usr/local"
      },
      :rbenv  => {
        :user_installs => [
          {
            :user   => "vagrant",
            :rubies => [
              "1.9.3-p392",
              "2.0.0-p0"
            ],
            :global => "1.9.3-p392"
          }
        ]
      },
      :mysql  => {
        :server_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      }
    }
  end
end
