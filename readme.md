# Apache with ModJK

* A Roboconf recipe to deploy, manage and configure Apache with ModJK.

# Installer

* Puppet.
* The included Puppet module has no external dependency.

# Tested with

* Ubuntu 12.04 and Puppet...
* Ubuntu 14.04 and Puppet...

# Usage

This recipes defines two things:

* **Apache-mjk-latest** represents an Apache server with mod_jk.
* **loadbalance_able_ajp** represents an abstract type. It designates something that
can be load balanced by Apache.

To use this recipe:

1. Reference this project in your POM (or copy its resources by hand).
2. Import **/net.roboconf.recipes.puppet-apache-mod-jk-latest/main.graph** in your own graph file.
3. Add the **loadbalance_able_ajp** facet to the components that should be load balanced by Apache.
