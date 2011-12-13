class RemoveOmniauth < ActiveRecord::Migration
  def up
    drop_table :user_tokens
  end

  def down
  end
end
