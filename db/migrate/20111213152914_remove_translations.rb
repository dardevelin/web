class RemoveTranslations < ActiveRecord::Migration
  def up
    Project.drop_translation_table! :migrate_data => true
  end

  def down
  end
end
