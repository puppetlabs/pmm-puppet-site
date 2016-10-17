class profile::pci_demo::linux_pci_baseline (
  $checking = true,
){

 #####################################################
 ##PCI Examples: Build and maintain a Secure Network##
 #####################################################

  ###Enable firewall service and enforce running state
  service { 'firewalld':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    noop      => $checking,
  }
 
  ###Enable hardened SSH
  #class { 'ssh_hardening': }

  file_line { 'PermitRootLogin':
    path  => '/etc/ssh/sshd_config',
    line  => 'PermitRootLogin no',
    match => '^PermitRootLogin',
    noop  => $checking,
  }

  ###Harden OS
  #class { 'os_hardening': }
  
  #########################################################
  ##PCI Example: Implement strong access control measures##
  #########################################################

  ###Manage/Lock accounts
  accounts::user { 'villain':
    comment => 'Bad Person',
    locked  => true
  }

  ###Disable insecure services
  $insecure_services = ['ftpd', 'telnetd']
  service { $insecure_services:
    ensure => stopped,
    enable => false,
  }
 
  ###Ensure OpenSSL toolkit is at latest version
  package { 'openssl':
    ensure => latest,
    noop   => $checking,
  }
  
  
  ############################################################
  ##PCI Example: Maintain a Vulnerability Management program##
  ############################################################

  ###Maintain up to date versions of selected vulnerability management software using modules available
  ###on the Puppet Forge

  include clamav

  ####################################################
  ##PCI Example: Regularly Monitor and Test Networks##
  ####################################################

  ###Install, configure, and maintain tools that do this for you using modules available on the Puppet Forge

  ###SIMP Module from forge

  #include aide

}
