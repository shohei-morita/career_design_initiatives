module LoginMacro
  def login_as(student)
    visit new_student_session_path
    fill_in 'Email', with: student.email
    fill_in 'Password', with: student.password
    click_button 'ログイン'
  end
end
