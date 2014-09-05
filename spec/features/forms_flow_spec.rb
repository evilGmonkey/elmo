require 'spec_helper'

feature 'forms flow', js: true do
  before do
    @user = create(:user)
    @form = create(:sample_form)
    login(@user)
  end

  scenario 'should work' do
    click_link('Forms')

    # First time printing should show tips.
    find('a.print-link').click
    expect(page).to have_selector('h4', 'Print Format Tips')
    click_button('OK')
    page.driver.browser.switch_to.alert.accept

    # Second time printing should not show tips.
    find('a.print-link').click
    page.driver.browser.switch_to.alert.accept

    # Should still be on same page.
    expect(current_url).to match(%r{/forms$})
  end
end