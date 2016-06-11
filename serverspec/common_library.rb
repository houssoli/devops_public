# -*- encoding: utf-8 -*-
##-------------------------------------------------------------------
## @copyright 2016 DennyZhang.com
## Licensed under MIT
##   https://raw.githubusercontent.com/DennyZhang/devops_public/master/LICENSE
##
## File : common_library.rb
## Author : DennyZhang.com <denny@dennyzhang.com>
## Description :
## --
## Created : <2016-05-10>
## Updated: Time-stamp: <2016-06-12 07:41:51>
##-------------------------------------------------------------------
################################################################################
require 'socket'
require 'serverspec'
require 'open3'

# Required by serverspec
set :backend, :exec

# TODO: don't hardcode download link
url_prefix = 'https://raw.githubusercontent.com/DennyZhang/devops_public/master/'

# TODO: conditional download to avoid network turbulence
%w(general_helper couchbase_helper elasticsearch_helper
   jenkins_helper).each do |library|
  download_command = "curl -o /opt/#{library}.rb #{url_prefix}/serverspec/#{library}.rb"
  system(download_command)
  require_relative "/opt/#{library}"
end

# TODO: better way to download depended bash scripts
download_command = "curl -o /root/wait_for.sh #{url_prefix}/bash/wait_for/wait_for.sh"
system(download_command)
#############################################################################
## File : common_library.rb ends
