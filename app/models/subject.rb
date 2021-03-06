# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_subjects_on_name  (name) UNIQUE
#
class Subject < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
