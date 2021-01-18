FactoryBot.define do
  factory :job_information do
    title { 'job' }
    content { 'good_job' }
    appealing_point { 'white_company' }
    pay { '4_000yen' }
    working_status { 'part_time_job' }
    working_hour { '15hour_per_a_day' }
    benefit { 'nothing_special' }
    day_off { '100_days_off_per_a_year' }
    selection { 'interview' }
    status { 0 }

    association :company
  end
end
