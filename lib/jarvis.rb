require 'active_record' unless defined? ActiveRecord
require "jarvis/version"
require 'ancestry'
require 'jarvis/models/is_brain_user'

module Jarvis
end


ActiveSupport.on_load(:active_record) do
  class ApplicationRecord
    def self.is_brain_user
      include Jarvis::IsBrainUser
    end
  end
end
