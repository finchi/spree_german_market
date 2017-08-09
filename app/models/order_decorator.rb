Spree::Order.class_eval do
  state_machine.before_transition to: :confirm do |order|
    order.valid_terms_and_conditions?
  end

  def valid_terms_and_conditions?
    unless terms_and_conditions?
      errors.add(:base, 'Terms and Conditions must be accepted!')
      false
    end
  end
end

Spree::PermittedAttributes.checkout_attributes << :terms_and_conditions