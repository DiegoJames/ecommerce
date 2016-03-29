# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe MyEmail do
  it{ should validate_presence_of(:email).with_message("Woops! Parece que olvidaste colocar el email") }
  it{ should validate_uniqueness_of(:email).with_message("Este correo ya fue registrado") }

  it "should not create with invalid email" do    
    email = MyEmail.new(email:"diego")
    expect(email.valid?).to be_falsy
  end

  it "should not create with invalid email" do    
    email = MyEmail.new(email:"dao@hotmail.cl")
    expect(email.valid?).to be_truthy
  end

end
