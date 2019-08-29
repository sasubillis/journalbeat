# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include journalbeat
class journalbeat (
  $ensure = 'present',
  $status = 'running',
  Boolean $manage_repo = true,
  Array[Stdlib::Httpurl] $logstash_hosts = ['https://localhost:5044'],
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
  $logstash_params = {
    logstash_hosts   => $logstash_hosts,
  }

  package { 'journalbeat':
    ensure  => $ensure,
  }

  file { '/etc/journalbeat/journalbeat.yml':
    ensure  => 'present',
    content => epp('journalbeat/journalbeat.yml',$logstash_params),
    owner   => 'root',
    group   => 'root',
    mode    => '0600',

  }

  service { 'journalbeat':
    ensure => $status,
  }
  Package['journalbeat'] -> Service['journalbeat']
}
