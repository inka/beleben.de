# == Schema Information
# Schema version: 20090709192250
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  salutation :string(255)
#  name       :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#  kiez       :string(255)
#

class Contact < ActiveRecord::Base
end
