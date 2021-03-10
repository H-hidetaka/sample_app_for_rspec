require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit user_sessions_path
        fill_in 'Email', with: 'email@examle.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password_confirmation', with: 'password'
        click_button 'SignIn'
        expect(page).to have_content ''

    end
    context 'フォームが未入力' do
      it 'ログイン処理が失敗する'
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する'
    end
  end
end
