class JoinScreenshots < ActiveRecord::Migration
  def up
    add_column :projects, :screenshot, :string
    Project.all.each do |project|
      file = project.screenshots.first.read_attribute(:file)
      project.update_column(:screenshot, file)
    end
  end

  def down
    remove_column :projects, :screenshot
  end
end
