require 'rails_helper'

RSpec.describe 'Educational_Background機能', type: :system do
  let!(:student) { create(:student) }

  describe '学歴情報の登録・編集' do
    context 'PROFILE画面から高校情報登録を選択した場合' do
      it '高校情報を登録できるテスト' do
        login_as student
        visit profile_students_path

        click_link '所属高校登録'

        select '福岡県', from: 'educational_background[location]'
        select '公立', from: 'educational_background[division]'
        fill_in 'educational_background[school_name]', with: '福岡県立京都高等学校'
        select_year_month('2018,4', from: '入学年月')
        select_year_month('2021,3', from: '卒業(予定)年月')
        fill_in 'educational_background[note]', with: '私が入試で落ちた高校'

        click_on '登録'

        expect(page).to have_content('福岡県')
        expect(page).to have_content('公立')
        expect(page).to have_content('福岡県立京都高等学校')
        expect(page).to have_content('2018年04月')
        expect(page).to have_content('2021年03月')
        expect(page).to have_content('私が入試で落ちた高校')
      end
    end

    context 'PROFILE画面から所属高校情報を選択した場合' do
      let!(:educational_background) { create(:educational_background, student_id: student.id) }
      it '所属高校情報が確認できるテスト' do
        login_as student
        visit profile_students_path

        click_link '所属高校情報'

        expect(page).to have_content('福岡県')
        expect(page).to have_content('公立')
        expect(page).to have_content('福岡県立築上中部高等学校')
        expect(page).to have_content('2018年04月')
        expect(page).to have_content('2021年03月')
        expect(page).to have_content('私の母校です。廃校になりました。')
      end

      it '所属高校情報が編集できるテスト' do
        login_as student
        visit student_educational_background_path(student.id)

        click_link '編集'

        select '富山県', from: 'educational_background[location]'
        select '私立', from: 'educational_background[division]'
        fill_in 'educational_background[school_name]', with: '私立高岡第一高等学校'
        select_year_month('2020,4', from: '入学年月')
        select_year_month('2021,3', from: '卒業(予定)年月')
        fill_in 'educational_background[note]', with: '編入しました'

        click_on '更新'

        expect(page).to have_content('富山県')
        expect(page).to have_content('私立')
        expect(page).to have_content('私立高岡第一高等学校')
        expect(page).to have_content('2020年04月')
        expect(page).to have_content('2021年03月')
        expect(page).to have_content('編入しました')
      end
    end
  end
end
