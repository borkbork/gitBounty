Warden::GitHub::Rails.setup do |config|
  config.add_scope :user, redirect_uri: '/login', scope: 'user:email,read:org, repo'
end
