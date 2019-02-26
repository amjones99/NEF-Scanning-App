# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  access     :integer
#  email      :string
#  name       :string
#  password   :string
#  userid     :integer
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
end
