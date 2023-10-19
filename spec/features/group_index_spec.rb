require 'rails_helper'

RSpec.describe 'groups#index', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    sign_in user

    @groups = [
      Group.create(
        id: 1,
        user_id: user.id,
        name: 'Clothes',
        icon: 'https://unsplash.com/photos/F_-0BxGuVvo'
      ),
      Group.create(
        id: 2,
        user_id: user.id,
        name: 'Stationery',
        icon: 'https://unsplash.com/photos/F_-0BxGuVvo'
      )
    ]

    visit groups_url(user.id)
  end

  describe '#Indexpage' do
    it 'can see the category name.' do
      @groups.each do |group|
        expect(page).to have_content(group.name)
      end
    end

    it 'can see the category icon.' do
      @groups.each do |group|
        expect(page).to have_css("img[src='#{group.icon}']")
      end
    end

    it 'redirects to the new category form when clicking "Add a new Category"' do
      click_link 'Add New Categories'
      expect(page).to have_current_path(new_group_path)
    end
  end
end
