# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recruiter.create(family_name: '田中', given_name: '太郎', family_name_kana: 'タナカ', given_name_kana: 'タロウ',
                email: 'admin@gmail.com', password: '111111', department: '所属なし', tel: '090', admin: true, approved: true)
