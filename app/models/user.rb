# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  description            :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("guest")
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  REGISTERED_ROLES = ['student', 'tutor']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_taggable_on :subjects

  enum role: %i[guest student tutor admin]

  has_one_attached :image
  has_many :comments, foreign_key: :recipient_id

  validates :image, :username, :phone, presence: true
  validates :username, :phone, uniqueness: true
end
