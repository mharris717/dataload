class MasterLoader
  include Singleton
  attr_accessor_nn :raw_table_load_order, :db_ops, :block_size
  fattr(:raw_table_delete_order) { raw_table_load_order.reverse }
  fattr(:tables_in_load_order) do
    raw_table_load_order.map { |x| table_hash[x.to_s]||raise("can't find table #{x}") }
  end
  fattr(:tables_in_delete_order) do
    raw_table_delete_order.map { |x| table_hash[x.to_s]||raise("can't find table #{x}") }
  end
  fattr(:table_hash) { {} }
  def add(tl)
    self.table_hash[tl.table_name.to_s] = tl
  end
  def delete_rows!
    tables_in_delete_order.each { |t| t.manager.delete_rows! }
  end
  def load_rows!
    tables_in_load_order.each { |t| t.loader.load! }
  end
  def run!
    tables_in_load_order.each do |t| 
      t.loader.block_size = block_size 
    end
    tm("MasterLoader run") do
      connect!
      delete_rows!
      load_rows!
    end
  end
  def connect!
    if db_ops[:adapter].to_s == 'sqlserver'
      gem 'activerecord-sqlserver-adapter'
      require 'active_record/connection_adapters/sqlserver_adapter'
      require File.dirname(__FILE__) + "/sqlserver_ext"
    end
    ActiveRecord::Base.establish_connection(db_ops)
    Dataload.log "Established Connection"
  end
end