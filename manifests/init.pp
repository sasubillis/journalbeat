# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include journalbeat
class journalbeat (
  $ensure = 'present',
  $status = 'enabled',
  Boolean $manage_repo = true,
  Array[Stdlib::Httpurl] $logstash_hosts = ['https://localhost:5044']
) {


  if ! ($ensure in [ 'present', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  if ! ($status in [ 'enabled', 'disabled', 'running', 'unmanaged' ]) {
    fail("\"${status}\" is not a valid status parameter value")
  }

  if ($manage_repo == true) {
    include elastic_stack::repo
  }


  package { 'journalbeat':
    ensure  => $ensure,
    content => epp('journalbeat/journalbeat.yml',$logstash_hosts),
  }

  file { '/etc/journalbeat/journalbeat.yml':
    ensure => 'present'

  }

  service { 'journalbeat':
    ensure => $status,
  }
  Package['journalbeat'] -> Service['journalbeat']
}
