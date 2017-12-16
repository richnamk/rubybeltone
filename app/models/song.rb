class Song < ActiveRecord::Base
    belongs_to :user
    has_many :adds, dependent: :destroy
    has_many :users_added, through: :adds, source: :user

    validates :title, :artist, presence: true, length: 2..25
end
