# frozen_string_literal: true
# We would like to be able to create an index on a string that is larger than 191 characters
# We also want our mysql databases to use utf8_mb4 encoding (the real unicode)
# This monkey patch is from the following Github comment:
# https://github.com/rails/rails/issues/9855#issuecomment-57665404
config = ActiveRecord::Base.configurations[Rails.env]

if ENV['USE_UTF8MB4'] && config['adapter'] == 'mysql2'
  config['encoding'] = 'utf8mb4'
  config['collation'] = 'utf8mb4_bin'

  ActiveRecord::ConnectionAdapters::Mysql2Adapter.class_eval do
    # enhance included create_table method
    def create_table(table_name, options = {}) #:nodoc:
      sql_options = options[:options] # always passed in via lib/active_record/migration/compatibility.rb
      sql_options = "ROW_FORMAT=DYNAMIC #{sql_options}" unless sql_options.to_s.include?("ROW_FORMAT")
      super(table_name, options.merge(options: sql_options))
    end

  def create_database(name, options = {collation:'utf8mb4_bin',charset:'utf8mb4',innodb_large_prefix:1})
      if options[:collation]
        execute "CREATE DATABASE #{quote_table_name(name)} DEFAULT COLLATE #{quote_table_name(options[:collation])}"
      elsif options[:charset]
        execute "CREATE DATABASE #{quote_table_name(name)} DEFAULT CHARACTER SET #{quote_table_name(options[:charset])}"
      elsif row_format_dynamic_by_default?
        execute "CREATE DATABASE #{quote_table_name(name)} DEFAULT CHARACTER SET `utf8mb4`"
      else
        raise "Configure a supported :charset and ensure innodb_large_prefix is enabled to support indexes on varchar(255) string columns."
      end
    end
  end
end
