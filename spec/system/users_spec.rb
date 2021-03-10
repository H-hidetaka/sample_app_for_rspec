require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'Email', with: 'email@example.com'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation' with: 'password'
          click_button 'SignUp'
          expect(page).to have_content 'User was successfully created.'
          expect(current_path).to eq login_path
      end
    end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する'
          visit new_user_path
          fill_in 'Email', with: ''
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation' with: 'password'
          click_button 'SignUp'
          expect(page).to have_content '1 error prohibited this user from being saved'
          expect(page).to have_content "Email can't be blank"
          expect(current_path).to eq users_path
      end
    end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する'
          existed_user = create(:user)
          visit new_user_path
          fill_in 'Email', with: existed_user.email
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: "password"
          click_button 'SignUp'
          expect(page).to have_content '1 error prohibited this user from being saved'
          expect(page).to have_content "Email has already been taken"
          expect(current_path).to eq users_path
          expect(page).to have_field 'Email', with: existed_user.email
      end
    end
  end

    describe 'マイページ' do
      context 'ログインしていない状態' do
        it 'マイページへのアクセスが失敗する'
          visit user_path(user)
          expect(page).to have_content('login required')
          expect(current_path).to eq login_path
      end
    end
  end
end

describe 'ログイン後' do
  before { login_as(user) }

  describe 'ユーザー編集' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの編集が成功する'
      visit edit_user_path(user)
      fill_in 'Email', with: 'update@example.com'
      fill_in 'Password', with: 'update_password'
      fill_in 'Password confirmation', with: 'update_password'
      click_button 'Update'
      expect(page).to have_content('User was successfully updated.')
      expect(current_path).to eq user_path(user)
    end
  end

  context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する'
        visit edit_user_path(user)
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Update'
        expect(page).to have_content('1 error prohibited this user from being saved')
        expect(page).to
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの編集が失敗する'
      end
      context '他ユーザーの編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する'
      end
    end

    describe 'マイページ' do
      context 'タスクを作成' do
        it '新規作成したタスクが表示される'
      end
    end
  end
end
