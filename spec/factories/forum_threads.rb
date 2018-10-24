# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :forum_thread do
    user_id { 1 }
    subject { "MyString" }
  end
end