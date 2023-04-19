require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "validations" do
    context "when name is nil" do
      it "is invalid" do
        expect(Board.new(name: nil).valid?).to be false
      end
    end
  end
end
