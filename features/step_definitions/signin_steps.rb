# frozen_string_literal: true

Given('I signed in with my email address {string}') do |email|
  step 'I am on the Sign in page'
  step "I sign up with my email address \"#{email}\""
  step "I use the magic link for \"#{email}\""
end

Given('I signed in as {string}') do |email|
  step "I signed in with my email address \"#{email}\""
end

Given('I signed in') do
  email = 'john.doe@example.org'
  create(:user, email: email)
  step "I signed in with my email address \"#{email}\""
end

When('I sign up with my email address {string}') do |email|
  @current_user_email = email
  fill_in('user[email]', with: email)
  click_on 'Aanmelden'
end

When('I sign up without an email address') do
  step 'I sign up with my email address ""'
end

When('I sign out') do
  within('nav') do
    click_on @user.decorate.to_label
    click_on 'Afmelden'
  end
end

Then(
  'I expect to see a page with instructions for {string} how to login'
) do |email|
  expect(page).to have_text('Controleer je e-mail')
  expect(page).to have_text(
    "We hebben een speciale link gemaild naar #{
      email
    }. Klik op de link in de e-mail om van start te kunnen gaan."
  )
end

Then('I expect to see the sign in page') do
  expect(current_path).to eql('/sign_in')
  expect(page).not_to have_css('nav')
  expect(page).to have_css('h1', text: 'Aanmelden bij Pele')
  expect(page).to have_field('user[email]')
  expect(page).to have_button('Aanmelden')
end

Then('I see an error telling me an email address is required') do
  expect(current_path).to eql('/sign_in')
  expect(page).to have_text('Email moet opgegeven zijn')
end

Then('I see an error telling me I have entered an invalid email address') do
  expect(current_path).to eql('/sign_in')
  expect(page).to have_text(/is geen geldig e-mailadres/)
end
