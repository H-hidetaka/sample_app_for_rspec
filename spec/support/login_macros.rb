module LoginMacros
  def login_as(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end
end
