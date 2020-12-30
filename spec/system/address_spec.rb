require 'rails_helper'

RSpec.describe 'address機能', type: :system do
  let!(:student) { create(:student) }

  describe 'address登録・編集機能' do
    context 'PROFILE画面から住所登録を選択した場合' do
      it '住所登録の文字列を確認するテスト' do
        login_as student
        visit profile_students_path

        click_link '住所登録'

        expect(page).to have_content('住所登録')
      end
    end

    context '住所登録画面からフォームを入力して登録した場合' do
      it '入力した住所が登録されていることを確認するテスト' do
        login_as student
        visit new_student_address_path(student.id)

        fill_in 'address[postcode]', with: '9300017'
        select '富山県', from: 'address[prefecture_code]'
        fill_in 'address[address_city]', with: '富山市'
        fill_in 'address[address_street]', with: '1-2-3'
        fill_in 'address[address_building]', with: '幻ビルヂング201号室'
        click_on '登録'

        expect(page).to have_content('9300017')
        expect(page).to have_content('富山県')
        expect(page).to have_content('富山市')
        expect(page).to have_content('1-2-3')
        expect(page).to have_content('幻ビルヂング201号室')
      end
    end

    context '登録住所画面から編集を選択した場合' do
      let!(:address) { create(:address, student_id: student.id) }

      it '登録情報を編集して更新できるテスト' do
        login_as student
        visit student_address_path(student.id)

        click_link '編集'

        fill_in 'address[postcode]', with: '8000344'
        select '福岡県', from: 'address[prefecture_code]'
        fill_in 'address[address_city]', with: '苅田町'
        fill_in 'address[address_street]', with: '新津'
        fill_in 'address[address_building]', with: '田中堂111'
        click_on '更新'

        expect(page).to have_content('8000344')
        expect(page).to have_content('福岡県')
        expect(page).to have_content('苅田町')
        expect(page).to have_content('新津')
        expect(page).to have_content('田中堂111')
      end
    end
  end
end
