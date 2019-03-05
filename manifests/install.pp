# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include lucee::install
class lucee::install {
  # install packages
  ['compat-libstdc++-33','libgcc','compat-libstdc++-33.i686','gcc','subversion'].each |$name| {
    package { $name:
      ensure   => $lucee::package_ensure,
      provider => 'yum',
    }
  }
}
