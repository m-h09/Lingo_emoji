# app/models/contact_form.rb
class ContactForm
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, :email, :message, presence: true

  def deliver
    return false unless valid?
    ContactMailer.contact_email(self).deliver_now
    true
  end
end
