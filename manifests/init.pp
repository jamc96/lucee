# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include lucee
class lucee(
  String $home_dir_path,
  String $web_dir_path,
  String $logs_dir_path,
  String $package_ensure,
  String $config_ensure,
  Optional[String] $source_installer,
) {
  # class containment
  include ::lucee::install
  include ::lucee::config
  # class relationship
  Class['::lucee::install']
  -> Class['::lucee::config']
}
