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
  Stdlib::Host $logstash_host = 'localhost',
  Stdlib::Port $logstash_port = 5044,
  Stdlib::Absolutepath $tls_ca_file = '/etc/pki/root/ca.pem'
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
    host           => $logstash_host,
    port           => $logstash_port,
    tls_ca_file    => $tls_ca_file,
  }

  package { 'journalbeat':
    ensure  => $ensure,
    version => '7.10.2',
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

  Package['journalbeat'] -> File['/etc/journalbeat/journalbeat.yml'] ~> Service['journalbeat']
}
