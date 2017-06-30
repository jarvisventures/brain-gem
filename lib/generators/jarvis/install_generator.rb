module Jarvis
    module Generators
        class InstallGenerator < Rails::Generators::Base
            include Rails::Generators::Migration
            source_root File.expand_path("../templates", __FILE__)

            desc "Creates Jarvis initializer, controllers, views, and routes."

            def self.next_migration_number(path)
                sleep 1
                Time.now.utc.strftime("%Y%m%d%H%M%S")
            end

            def install
                # Create initializer
                copy_file "#{self.class.source_root}/config/initializers/jarvis.rb", "config/initializers/jarvis.rb"
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
