# -*- encoding : utf-8 -*-
ActiveRecord::Schema.define(:version => 0) do
  begin
    drop_table :my_objects
    drop_table :foos
  rescue
  end

  create_table :my_objects do |t|
    t.datetime :created_at
  end
  create_table :foos do |t|
    t.datetime :created_at
  end
end
