class AddNotNullToColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :awards, :student_id, false
    change_column_null :companies, :recruiter_id, false
    change_column_null :company_industry_conditions, :company_id, false
    change_column_null :company_industry_conditions, :condition_id, false
    change_column_null :educational_backgrounds, :student_id, false
    change_column_null :extracurricular_activities, :student_id, false
    change_column_null :job_information_conditions, :job_information_id, false
    change_column_null :job_information_conditions, :condition_id, false
    change_column_null :job_informations, :company_id, false
    change_column_null :qualifications, :student_id, false
    change_column_null :scout_job_information, :job_information_id, false
    change_column_null :scout_job_information, :scout_id, false
    change_column_null :scouts, :recruiter_id, false
    change_column_null :scouts, :student_id, false
    change_column_null :self_introductions, :student_id, false
    change_column_null :student_desirable_conditions, :student_id, false
    change_column_null :student_desirable_conditions, :condition_id, false
    change_column_null :target_lists, :student_id, false
    change_column_null :target_lists, :recruiter_id, false
  end
end
