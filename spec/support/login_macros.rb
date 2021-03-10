require 'rails_helper'

RSpec.describe '認証のテスト', type: :feature do
  let(:user) { create(:user) }
  subject { page }

  describe 'ユーザー認証のテスト' do
    context 'ユーザーログインのテスト' do
      it 'ログインできること' do
        visit new_user_session_path
        login(user) # メソッドを使用
        is_expected.to have_content 'ログアウト'
      end
    end
  end
end
