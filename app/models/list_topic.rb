# == Schema Information
#
# Table name: list_topics
#
#  id          :integer          not null, primary key
#  author_id   :integer          not null
#  title       :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ListTopic < ActiveRecord::Base
  validates :author, :title, presence: true

  has_many(
    :lists,
    class_name: 'List',
    foreign_key: :list_topic_id,
    primary_key: :id,
    dependent: :destroy
  )

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :list_items, through: :lists, source: :list_items
end
