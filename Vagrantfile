Vagrant.configure("2") do |config|
    boxes = [
        {
            :hostname => "Domain Controller",
            :box => "Windows Server",
            :ip => "10.0.2.10",
        },
        {
            :hostname => "Windows Client",
            :box => "Windows 10",
            :ip => "10.0.2.11",
        },
        {
            :hostname => "Ubuntu Client",
            :box => "bento/ubuntu-22.04",
            :ip => "10.0.2.12",
            :ssh_port => "22",
        },
        {
            :hostname => "Mail Server",
            :box => "bento/ubuntu-22.04",
            :ip => "10.0.2.13",
            :ssh_port => "22",   
        },
        {
            :hostname => "Web server",
            :box => "bento/debian-11.0",
            :ip => "10.0.2.10",
            :ssh_port => "22",   
        },

    ]

    boxes.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network :private_network, ip: machine[:ip]
            node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
            node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--memory", 4096]
                vb.customize ["modifyvm", :id, "--cpus", 3]
            end
        end
    end
end