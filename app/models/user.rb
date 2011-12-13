require 'digest'

class User < ActiveRecord::Base

  devise :database_authenticatable

  has_friendly_id :name, use_slug: true

  has_many :posts, foreign_key: :author_id

end
