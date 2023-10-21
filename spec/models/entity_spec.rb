require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.new(name: 'Manzi', email: 'example@mail.com', password: 'password') }
  let(:group) { Group.new(name: 'Pizaa', icon: 'https://images.pexels.com/photos/53621/calculator-calculation-insurance-finance-53621.jpeg', user_id: user.id) }
  let(:entity) { Entity.new(name: 'Dress', amount: 10, author_id: user.id) }

  describe 'Validations' do
    it 'should valid name ' do
      entity.name = nil
      expect(entity).to_not be_valid
    end
    it 'is not valid without an amount ' do
      entity.amount = nil
      expect(entity).to_not be_valid
    end
    it 'it has many Groups' do
      relationship = described_class.reflect_on_association(:groups)
      expect(relationship.macro).to eq :has_many
    end
  end
end
