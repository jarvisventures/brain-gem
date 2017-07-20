require 'active_record' unless defined? ActiveRecord
require "jarvis/version"
require 'ancestry'
require 'jarvis/models/is_brain_user'

module Jarvis
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
      include Jarvis
    end
  end
