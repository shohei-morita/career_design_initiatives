FactoryBot.define do
  factory :company do
    name { '○○株式会社' }
    foundation_year { '2015/01/01' }
    president_name { '山田太郎' }
    capital { '500万円' }
    revenue { '5億円（2020年度）' }
    number_of_employees { '500人' }
    business_outline { '人材紹介サービス' }
    url { 'www.url.com' }

    after(:create) do |company|
      create_list(:job_information, 5, company: company)
    end

    association :recruiter
  end
end
