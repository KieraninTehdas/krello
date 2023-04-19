require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    context "when title is nil" do
      it "is invalid" do
        expect(Card.new(title: nil).valid?).to be false
      end
    end
  end
end
