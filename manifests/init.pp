# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include lucee
class lucee(
  String $home_dir_path              = '/opt/lucee',
  String $web_dir_path               = '/opt/lucee/tomcat',
  String $logs_dir_path              = '/opt/lucee/tomcat/logs',
  String $package_ensure             = 'present',
  String $config_ensure              = 'present',
  Optional[String] $source_installer = undef,
) {
  # class containment
  include ::lucee::install
  include ::lucee::config
  # class relationship
  Class['::lucee::install']
  -> Class['::lucee::config']
}
