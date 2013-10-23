#
# Author:: Ben Dixon
# Cookbook Name:: basic_security-tlq
# Attributes:: default
#

# locales to add to /var/lib/locales/supported.d/local
default[:locales] = ['en_GB ISO-8859-1','en_GB.UTF-8 UTF-8']
# default environment flag (not linked to rails environment)
default[:environment] = 'development'
