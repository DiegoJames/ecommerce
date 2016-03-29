# == Schema Information
#
# Table name: attachments
#
#  id                   :integer          not null, primary key
#  product_id           :integer
#  archivo_file_name    :string
#  archivo_content_type :string
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :archivo, attachment_presence: true
  has_attached_file :archivo, path: ":rails_root/archivos/:id/:styles/:filename"

  do_not_validate_attachment_file_type :archivo #Necesita cambiarse
  
end
