class Post < ActiveRecord::Base

  markdownize! :body

  belongs_to :author, :class_name => 'User'
  validates_associated :author

  delegate :year, to: :created_at
  delegate :month, to: :created_at

  delegate :name, to: :author, prefix: true

  has_friendly_id :title, use_slug: true

  scope :from_archive, ->(year, month = nil) do
    if month
      where(arel_table[:created_at].gteq Date.new(year, month)).
        where(arel_table[:created_at].lt Date.new(year, month+1))
    else
      where(arel_table[:created_at].gteq Date.new(year)).
        where(arel_table[:created_at].lt Date.new(year+1))
    end
  end

end
