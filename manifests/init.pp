class softec_sudo inherits sudo {

  case $::operatingsystem {
    'Ubuntu': {
      case $::lsbdistcodename {
        'hardy': {
          File[$sudo::config_file] {
            source  => undef,
            content => template('softec_private/etc/sudoers_hardy.erb')
          }
        }
        default : {
          File[$sudo::config_file] {
            source  => 'puppet:///modules/softec_private/etc/sudoers_default'
          }
        }
      }
    }
    default : {
      fail('only Ubuntu OS is supported')
    }
  }


}
