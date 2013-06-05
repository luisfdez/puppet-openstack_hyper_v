# Class: windows
#
# This module contains basic configuration tasks for
# building windows compute nodes for openstack
#
# Parameters: none
#
# Actions:
#


class windows {
  $winpath         = "${::systemroot}\\sysnative;c:\\winpe\\bin;${::path}"
  $powershell_path = "${::systemroot}\\sysnative\\WindowsPowerShell\\v1.0"
  $path            = "${winpath};${powershell_path};${::path}"
  #Default Time Source and Zone
  #$timeserver = 'bonehed.lcs.mit.edu'
  #$timezone   = 'Eastern Standard Time'
  Exec{
    path => "${powershell_path};${winpath};${::path}",
  }
  class { 'windows::commands': }
  class { 'windows::ntp': }
  class { 'windows::disable_firewalls': }
  class { 'windows::enable_auto_update': }
  class { 'windows::tools::7zip': }
  class { 'windows::rdp': }
  class { 'windows::tools::vexasoftcmdlet': }
  class { 'windows::tools::git': }
  # Optional
  class { 'windows::java': }
  class { 'windows::tools::notepadplusplus': }
  class { 'windows::tools::google_chrome': }
  #class {' windows::tools::visualcplusplus2010': }
  #class { 'windows::tools::visualcplusplus2012': }
  class { 'windows::tools::freerdp': }
# Begin Python Stack
  class { 'windows::python': }
  class { 'windows::python::m2crypto': }
# Classes extracting installers to %TEMP%\PLATLIB
# -- Moving to site_packages.pp
#  class { 'windows::python::mysql_python': }
#  class { 'windows::python::pycrypto': }
#  class { 'windows::python::pywin32': }
#  class { 'windows::python::greenlet': }
#  class { 'windows::python::lxml': }
  class { 'windows::python::site_packages': }
  class { 'windows::python::easyinstall': }
  class { 'windows::python::pip': }
  class { 'windows::openstack::folders':}

}
