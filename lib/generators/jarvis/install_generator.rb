module Jarvis
    module Generators
        class InstallGenerator < Rails::Generators::Base
            include Rails::Generators::Migration
            source_root File.expand_path("../templates", __FILE__)
            class_option :orm

            def create_migrations
                Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
                    name = File.basename(filepath)
                    migration_template "migrations/#{name}", "db/migrate/#{name}"
                end
            end
        end
    end
end