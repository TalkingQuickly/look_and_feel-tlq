#
# Author:: Ben Dixon
# Cookbook Name:: look_and_feel-tlq
# Attributes:: default
#

# locales to add to /var/lib/locales/supported.d/local
# GB: 'en_GB ISO-8859-1','en_GB.UTF-8 UTF-8'
default[:locales] = []
# default environment flag (not linked to rails environment)
default[:environment] = 'development'
