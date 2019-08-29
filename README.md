# journalbeat

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README template below provides a starting point with details about what information to include in your README.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with journalbeat](#setup)
    * [What journalbeat affects](#what-journalbeat-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with journalbeat](#beginning-with-journalbeat)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module sets ut the Elastic Beat journabeat 

### Beginning with journalbeat

This module assumes the ELK stack is up and running in you environment, at the very least a logstash server running with a resolvable url 

## Usage
```
class { 'journalbeat':
      logstash_hosts => ['https://logstash.example.com:5044'],
  }
```

If using custom path for TLS/SSL certificates for logging

```
class { 'journalbeat':
      logstash_hosts => 'logstash.example.com',
      tls_ca_file    => '/mypath/exampleca.pem',
      tls_cert_file  => '/mypath/examplecert.pem'
      tls_key_file   => '/mypath/examplekey.pem',
  }
```
## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
