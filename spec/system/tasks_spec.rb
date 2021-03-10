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

      context 'タスクの一覧ページにアクセス' do
        it 'すべてのユーザーのタスク情報が表示される' do
          task_list = create_list(:task, 3)
          visit tasks_path
          expect(page).to have_content task_list[0].title
          expect(page).to have_content task_list[1].title
          expect(page).to have_content task_list[2].title
          expect(current_path).to eq tasks_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'タスク新規登録' do
      context 'フォームの入力値が正常' do
        it 'タスクの新規作成が成功する' do
          visit new_task_path
          fill_in 'Title', with: 'test_title'
          fill_in 'Content', with: 'test_content'
          select 'doing' , with: DateTime.new(2020, 6, 1, 10, 30)
          click_button 'Create Task'
          expect(page).to have_content 'Title: test_title'
          expect(page).to have_content 'Content: test_content'

          expect(page).to have_content 'Deadline: 2020/6/1 10:30'

        end
    end
  end
