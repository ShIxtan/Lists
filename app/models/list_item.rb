# == Schema Information
#
# Table name: list_items
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  list_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListItem < ActiveRecord::Base
  validates :text, :list, presence: true

  belongs_to(
    :list,
    class_name: 'List',
    foreign_key: :list_id,
    primary_key: :id
  )

  has_one :topic, through: :list, source: :topic
  has_one :author, through: :list, source: :author
end
