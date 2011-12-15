class Project < ActiveRecord::Base

  after_create :update_downloads!, if: :open_source?

  validates :title, :url, :description, :extended_description, :category, presence: true
  validates :category, inclusion: WorkCategory.names

  markdownize! :description, tab_width: 2, hierarchy: 1
  markdownize! :extended_description, tab_width: 2, hierarchy: 1

  has_many :screenshots
  mount_uploader :screenshot, ScreenshotUploader

  has_friendly_id :title, use_slug: true

  scope :open_source, where(category: 'open-source')
  scope :published, where(published: true)
  scope :promoted, published.where(promoted: true).order(arel_table[:created_at].desc)
  scope :ordered, order(arel_table[:name].asc)

  def self.update_downloads!
    open_source.each do |open_source_project|
      open_source_project.update_downloads!
    end
  end

  def open_source?
    category == 'open-source'
  end

  def update_downloads!
    update_attribute(:downloads,
                      RubygemsFetcher.get(:downloads,
                                          rubygem))
  end

  def normalize_friendly_id text
    rubygem.blank? ? super(FriendlyId::SlugString.new(text)) : rubygem
  end

end
