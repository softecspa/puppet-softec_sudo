define softec_sudo::alias (
  $ensure=present,
  $sudo_alias,
  $items,
  $comment='',
  $target = '/etc/sudoers',
){

  # su hardy viene pushato un file statico
  if $::lsbdistcodename != 'hardy' {
    sudo::alias {$name:
      ensure  => $ensure,
      sudo_alias  => $sudo_alias,
      items       => $items,
      comment     => $comment,
      target      => $target
    }
  }
}
