require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let(:user) { create(:user) }
  let(:task) { create(:task)}

  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context 'タスクの新規登録ページにアクセス' do
        it '新規登録ページへのアクセスが失敗する' do
          visit new_task_path
          click_button 'SignUp'
          except(page).to have_content('Login required')
          except(current_path).to eq login_path
        end
      end

      context 'タスクの編集ページにアクセス' do
        it '編集ページのアクセスが失敗する' do
          visit edit_task_path
          expect(page).to have_content task.title
          expect(current_path).to eq new_task_path(task)
        end
      end

      context 'タスクの編集ページにアクセス'　do
        it '編集ページへのアクセスが失敗する'　do
          visit edit_task_path(task)
          expect(page).to have_content('Login required')
          expect(current_path).to eq login_path
        end
      end

      context 'タスクの詳細ページにアクセス' do
        it 'タスクの詳細情報が表示される'
          visit task_path(task)
          expect(page).to have_content task.title
          expect(current_path).to eq task_path(task)
        end
      end



      end
