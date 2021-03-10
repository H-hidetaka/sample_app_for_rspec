require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let(:user) { create(:user) }
  let(:user) { create(:task)}

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context 'タスクの新規登録ページにアクセス' do
        it '新規登録ページへのアクセスが失敗する' do
          visit new_task_path
          click_button 'SignUp'
          except(page).to have_content 'User was successfully created. '
          except(current_path).to eq login_path
        end
      end
    end
  end
