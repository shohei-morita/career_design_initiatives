require 'rails_helper'

RSpec.describe 'extracurricular_activity機能', type: :system do
  describe '課外活動情報の登録・編集' do
    context 'PROFILE画面から高校情報登録を選択した場合' do
      let!(:student) { create(:student) }
      it '課外活動を登録できるテスト' do
        login_as student
        visit profile_students_path

        click_on '課外活動登録'

        fill_in 'extracurricular_activity[name]', with: '少林寺拳法'
        select_year('2018', from: '開始年')
        select_year('2021', from: '終了年')
        fill_in 'extracurricular_activity[summary]', with: '昔習っていました'

        click_on '登録'

        expect(page).to have_content('少林寺拳法')
        expect(page).to have_content('2018年')
        expect(page).to have_content('2021年')
      end
    end

    context 'PROFILE画面から登録高校情報一覧を選択した場合' do
      let!(:student_2nd) { create(:student_2nd) }
      before do
        login_as student_2nd
        visit profile_students_path
      end
      it '課外活動一覧を確認できる' do
        # login_as student_2
        # visit profile_students_path

        click_link '登録課外活動一覧'

        expect(page).to have_content('name_1')
        expect(page).to have_content('name_2')
        expect(page).to have_content('name_3')
        expect(page).to have_content('name_4')
        expect(page).to have_content('name_5')
      end

      it '任意の課外活動を編集できる' do
        click_link '登録課外活動一覧'
        click_link '編集', match: :first

        fill_in 'extracurricular_activity[name]', with: '少林寺拳法'
        select_year('2018', from: '開始年')
        select_year('2021', from: '終了年')
        fill_in 'extracurricular_activity[summary]', with: '昔習っていました'

        click_on '更新'

        expect(page).to have_content('少林寺拳法')
        expect(page).to have_content('name_7')
        expect(page).to have_content('name_8')
        expect(page).to have_content('name_9')
        expect(page).to have_content('name_10')
      end

      it '任意の課外活動を削除できる' do
        click_link '登録課外活動一覧'
        click_link '削除', match: :first
        page.accept_confirm

        expect(page).to have_content('name_', count: 4)
      end
    end
  end
end
