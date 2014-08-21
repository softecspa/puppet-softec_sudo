class softec_sudo inherits sudo {

  case $::operatingsystem {
    'Ubuntu': {
      case $::lsbdistcodename {
        'hardy': {
          File['/etc/sudoers'] {
            source  => undef,
            content => template("softec_sudo/etc/sudoers_hardy.erb")
          }
          file { '/etc/sudoers.d':
            ensure  => directory,
            mode   => '755',
            owner => root,
            group => root,
          }
        }
        default : {
          File['/etc/sudoers'] {
            source  => 'puppet:///modules/softec_sudo/etc/sudoers_default'
          }
        }
      }
    }
    default : {
      fail('only Ubuntu OS is supported')
    }
  }


}
