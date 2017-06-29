module Jarvis
    module Generators
        class InstallGenerator < Rails::Generators::Base
            include Rails::Generators::Migration
            source_root File.expand_path("../templates", __FILE__)

            desc "Creates Jarvis initializer, controllers, views, and routes."
            
            def install
                # Create initializer
                copy_file "config/initializers/jarvis.rb", "config/initializers/jarvis.rb"

                # Create controllers
                directory "app/controllers/jarvis", "app/controllers/jarvis"

                # Add routes
                route %{
                    scope :module => 'jarvis' do
                        get '/jarvis/users' => 'users#show', :as => :jarvis_users
                    end
                }
            end

            def create_migrations
                Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
                    name = File.basename(filepath)
                    migration_template "migrations/#{name}", "db/migrate/#{name}"
                end
            end
        end
    end
end