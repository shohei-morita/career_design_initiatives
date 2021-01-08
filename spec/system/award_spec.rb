require 'rails_helper'

RSpec.describe '表彰情報機能', type: :system do
  describe '表彰情報の登録・編集' do
    context 'PROFILE画面から表彰情報登録を選択した場合' do
      let!(:student) { create(:student) }
      before do
        login_as student
        visit profile_students_path
      end
      it '表彰情報を登録できるテスト' do
        click_on '表彰情報登録'

        fill_in 'award[title]', with: '永年勤続表彰'
        select_year('2018', from: '受賞年')
        fill_in 'award[summary]', with: '実は受賞していません'

        click_on '登録'

        expect(page).to have_content('永年勤続表彰')
        expect(page).to have_content('2018年')
      end
    end

    context 'PROFILE画面から表彰情報一覧を選択した場合' do
      let!(:student_2nd) { create(:student_2nd) }
      before do
        login_as student_2nd
        visit profile_students_path
      end
      it '表彰情報一覧を確認できる' do
        click_link '表彰情報一覧'

        expect(page).to have_content('title_1')
        expect(page).to have_content('title_2')
        expect(page).to have_content('title_3')
        expect(page).to have_content('title_4')
        expect(page).to have_content('title_5')
      end

      it '任意の表彰情報を編集できる' do
        click_link '表彰情報一覧'
        click_link '編集', match: :first

        fill_in 'award[title]', with: '表彰されたい'
        select_year('2018', from: '受賞年')
        fill_in 'award[summary]', with: '願望です'

        click_on '更新'

        expect(page).to have_content('表彰されたい')
        expect(page).to have_content('title_7')
        expect(page).to have_content('title_8')
        expect(page).to have_content('title_9')
        expect(page).to have_content('title_10')
      end

      it '任意の表彰情報を削除できる' do
        click_link '表彰情報一覧'
        click_link '削除', match: :first
        page.accept_confirm

        expect(page).to have_content('title_', count: 4)
      end
    end
  end
end
