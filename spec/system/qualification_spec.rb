require 'rails_helper'

RSpec.describe 'Qualification機能', type: :system do
  let!(:student) { create(:student) }

  describe '学歴情報の登録・編集' do
    before do
      login_as student
    end
    context 'PROFILE画面から資格情報登録を選択した場合' do
      it '資格情報を登録できるテスト' do
        visit profile_students_path

        click_link '資格情報登録'

        fill_in 'qualification[qualification_1st]', with: '英語'
        fill_in 'qualification[qualification_2nd]', with: '日本語'
        fill_in 'qualification[qualification_3rd]', with: '中国語'
        fill_in 'qualification[qualification_4th]', with: 'タガログ語'
        fill_in 'qualification[qualification_5th]', with: 'バスク語'
        fill_in 'qualification[note]', with: '語学マスターを目指しています'

        click_on '登録'

        expect(page).to have_content('英語')
        expect(page).to have_content('日本語')
        expect(page).to have_content('中国語')
        expect(page).to have_content('タガログ語')
        expect(page).to have_content('バスク語')
        expect(page).to have_content('語学マスターを目指しています')
      end
    end

    context 'PROFILE画面から資格情報を選択した場合' do
      let!(:qualification) { create(:qualification, student_id: student.id) }
      it '資格情報が確認できるテスト' do
        visit profile_students_path

        click_link '資格情報'

        expect(page).to have_content('英検準２級')
        expect(page).to have_content('TOEIC 850点')
        expect(page).to have_content('世界遺産検定３級')
        expect(page).to have_content('日商簿記検定３級')
        expect(page).to have_content('ビジネス実務法務検定３級')
        expect(page).to have_content('学校の勉強の傍でがんばりました')
      end

      it '資格情報が編集できるテスト' do
        visit student_qualification_path(student.id)

        click_link '編集'

        fill_in 'qualification[qualification_1st]', with: '英語_2'
        fill_in 'qualification[qualification_2nd]', with: '日本語_2'
        fill_in 'qualification[qualification_3rd]', with: '中国語_2'
        fill_in 'qualification[qualification_4th]', with: 'タガログ語_2'
        fill_in 'qualification[qualification_5th]', with: 'バスク語_2'
        fill_in 'qualification[note]', with: '語学マスターを目指しています_2'

        click_on '更新'

        expect(page).to have_content('英語_2')
        expect(page).to have_content('日本語_2')
        expect(page).to have_content('中国語_2')
        expect(page).to have_content('タガログ語_2')
        expect(page).to have_content('バスク語_2')
        expect(page).to have_content('語学マスターを目指しています_2')
      end
    end
  end
end
