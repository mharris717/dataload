class BatchInsert
  include FromHash
  attr_accessor :rows
  fattr(:table_name) { rows.first.class.table_name }
  fattr(:column_names) { rows.first.sorted_column_names }
  fattr(:values_sql) do
    "VALUES " + rows.map { |x| x.insert_values_sql }.join(", ")
  end
  fattr(:columns_sql) do
    "(" + column_names.join(", ") + ")"
  end
  fattr(:insert_sql) do
    "INSERT into #{table_name} #{columns_sql} #{values_sql};"
  end
  def insert!
    tm("insert_sql") { insert_sql }
    tm("actual insert") { ActiveRecord::Base.connection.execute(insert_sql) }
  end
end
    