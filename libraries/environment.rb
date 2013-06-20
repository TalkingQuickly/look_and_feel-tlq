class Chef::Recipe
  [:vagrant, :staging, :production].each do |env|
    define_method "in_#{env}_env?" do
      in_environment? env
    end
  end

  def in_environment? environment
    node[:environment].to_s == environment.to_s
  end

  def environment
    node[:environment].to_sym
  end
end
