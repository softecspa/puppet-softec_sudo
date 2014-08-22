define softec_sudo::conf (
  $ensure          = present,
  $priority        = 10,
  $content         = undef,
  $source          = undef,
  $sudo_config_dir = undef,
  $sudo_file_name  = undef
) {

  $real_file_name = $sudo_file_name? {
    undef   => $name,
    default => $sudo_file_name
  }

  if $::lsbdistcodename != 'hardy' {
    sudo::conf {$name:
      ensure          => $ensure,
      priority        => $priority,
      content         => $content,
      source          => $source,
      sudo_config_dir => $sudo_config_dir,
      sudo_file_name  => $real_file_name
    }
  }

}
