module LoginMacro
  def login_as(user)
    if user.instance_of?(Student)
      visit new_student_session_path
    else
      visit new_recruiter_session_path
    end
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
  end
end
