require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.new(name: 'Manzi', email: 'manzitre@mail.com', password: '123456') }
  let(:group) { Group.new(name: 'Shopping', icon: 'https://images.pexels.com/photos/53621/calculator-calculation-insurance-finance-53621.jpeg', user_id: user.id) }


  describe 'Validations' do
    it 'should allow valid name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'should allow valid user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end
    it 'it has many Entities' do
      relationship = described_class.reflect_on_association(:entities)
      expect(relationship.macro).to eq :has_many
    end
  end
end
