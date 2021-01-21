FactoryBot.define do
  factory :job_information do
    sequence(:title, 'job_1')
    sequence(:content, 'good_1')
    sequence(:appealing_point, 'white_company_n')
    sequence(:pay, '4_000yen')
    sequence(:working_status, 'part_time_job_1')
    sequence(:working_hour, '15hour_per_a_day_1')
    sequence(:benefit, 'nothing_special_1')
    sequence(:day_off, '100_days_off_per_a_year_1')
    sequence(:selection, 'interview_1')
    status { 0 }

    association :company
  end
end
