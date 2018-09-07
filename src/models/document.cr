class Document < Granite::Base
  adapter pg
  table_name documents

  # id : Int64 primary key is created for you
  field name : String
  field description : String
  timestamps
end
