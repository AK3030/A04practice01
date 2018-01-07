# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class Link < ApplicationRecord

  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true

  belongs_to :user

  has_many :comments


end
