# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include lucee::config
class lucee::config {
  # default values
  File {
    ensure => $lucee::config_ensure,
    owner  => 'lucee',
    group  => 'lucee',
    selinux_ignore_defaults => true,
  }
  # create directories
  [$lucee::home_dir_path, $lucee::web_dir_path].each |$name| {
    file { $name:
      ensure => directory,
    }
  }
  file { $lucee::logs_dir_path:
    ensure  => directory,
    mode    => '0775',
    require => File[$lucee::web_dir_path],
  }
  # create files
  if $lucee::source_installer {
    file { '/tmp/lucee.run':
      source  => $lucee::source_installer,
      mode    => '0775',
      owner   => 'lucee',
      group   => 'lucee',
      require => File[$lucee::home_dir_path],
    }
  }
}
