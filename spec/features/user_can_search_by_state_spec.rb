require 'rails_helper'

feature "user can search for house members" do
  scenario "user submits valid state name" do
    #As a user, when I visit '/'
    visit '/'

    select "Colorado", from: :state
    #this means I select CO from dropdown menu
    click_on "Locate Members of the House"

    expect(current_path).to eq(search_path)
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(page).to have_content("7 Results")
    expect(page).to have_css(".member", count: 7)

    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".party")
      expect(page).to have_css(".district")
    end
  end
end


# As a user
# When I visit "/"
# And I select "Colorado" from the dropdown
# And I click on "Locate Members of the House"
# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of the 7 members of the house for Colorado
# And I should see a name, role, party, and district for each member
