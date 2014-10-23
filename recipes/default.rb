# htop is a prettier (but more resource intensive) alternative
# to top.
package 'htop'

# Vim because we're going to want to edit Rails config files
package 'vim'

# Because not everyone will send us nice  .tar.gz files
package 'unzip'

locales "Add locales" do
  locales node["look_and_feel-tlq"]["additional_locales"]
end

# Add a banner to ssh login if we're in the production environment
if node[:environment] == 'production'
  sshd_config = '/etc/ssh/sshd_config'

  seds = []
  echos = ["\n"]

  banner_path = '/etc/ssh_banner'

  seds << 's/^Banner/#Banner/g'
  echos << "Banner #{banner_path}"

  template banner_path do
    owner 'root'
    group 'root'
    mode '0644'
    source 'production_ssh_banner.erb'
  end

  bash 'Adding visual flags for production environment' do
    user 'root'
    code <<-EOC
      #{seds.map { |rx| "sed -i '#{rx}' #{sshd_config}" }.join("\n")}
      #{echos.map { |e| %Q{echo "#{e}" >> #{sshd_config}} }.join("\n")}
    EOC
  end

  service 'ssh' do
    provider Chef::Provider::Service::Upstart
    supports :restart => true
    action :restart
  end
end
