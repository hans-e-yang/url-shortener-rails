class Url < ApplicationRecord
  RESERVED_NAMES = %w[urls].freeze

  belongs_to :user

  validates :body, presence: true
  validates :alias, presence: true, uniqueness: true,
    exclusion: { in: RESERVED_NAMES, message: "name is reserved" }
end
