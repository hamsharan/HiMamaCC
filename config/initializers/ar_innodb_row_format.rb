require 'active_record/connection_adapters/abstract_mysql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class AbstractMysqlAdapter
      NATIVE_DATABASE_TYPES[:string] = { :name => "varchar", :limit => 191 }
      SET GLOBAL innodb_file_format=Barracuda;
      SET GLOBAL innodb_file_per_table=ON;
      innodb_large_prefix=1
    end
  end
end
