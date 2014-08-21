# Defined resource to manage sudoers user specification lines.
#
#  attributes:
#   * name - arbitrary string used to determine uniqueness
#   * users - list of users
#   * hosts - list of hosts
#   * commands - list of commands
define softec_sudo::spec(
  $ensure=present,
  $users, $hosts, $commands,
  $comment='',
  $target='/etc/sudoers'
) {

  if $::lsbdistcodename != 'hardy' {
    sudo::spec {$name:
      ensure    => $ensure,
      users     => $users,
      hosts     => $hosts,
      commands  => $commands,
      comment   => $comment,
      target    => $target
    }

    if !defined(File[$target]) {
      file{$target :
        mode  => '0440',
        require => Sudo::Spec[$name]
      }
    }

  }
}
