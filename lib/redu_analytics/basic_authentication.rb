require 'active_support/core_ext'

module ReduAnalytics
  class BasicAuthentication
    ENABLED = false
    USERNAME, PASSWORD = 'admin', 'admin'
    cattr_accessor :enabled, :username, :password
  end
end
