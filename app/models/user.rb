class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  validates :alias, presence: true

  after_create :create_profile

  has_one :profile, dependent: :destroy

  has_many :commission, dependent: :destroy

  acts_as_messageable
end
