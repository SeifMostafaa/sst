# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
20.times do |i|
  User.create(email: "user-#{i + 101}@example.com", password: 'password', password_confirmation: 'password',
              full_name_ar: 'مجدي محمود محمد حامد', full_name_en: 'Magdy Mahmoud Mohamed Hamed', role: :admin, locale: :en, phone: "+201111111#{i + 101}", date_of_birth: Date.today, status: :active, gender: :male, username: "user#{i + 101}")
end

20.times do |i|
  User.create(email: "user-#{i + 202}@example.com", password: 'password', password_confirmation: 'password',
              full_name_ar: 'مجدي محمود محمد حامد', full_name_en: 'Magdy Mahmoud Mohamed Hamed', role: :staff, locale: :ar, phone: "+201111111#{i + 202}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 202}")
end

20.times do |i|
  User.create(email: "user-#{i + 303}@example.com", password: 'password', password_confirmation: 'password',
              full_name_ar: 'مجدي محمود محمد حامد', full_name_en: 'Magdy Mahmoud Mohamed Hamed', role: :teacher, locale: :en, phone: "+201111111#{i + 303}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 303}")
end

20.times do |i|
  User.create(email: "user-#{i + 404}@example.com", password: 'password', password_confirmation: 'password',
              full_name_ar: 'مجدي محمود محمد حامد', full_name_en: 'Magdy Mahmoud Mohamed Hamed', role: :parents, locale: :ar, phone: "+201111111#{i + 404}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 404}")
end

20.times do |i|
  User.create(email: "user-#{i + 505}@example.com", password: 'password', password_confirmation: 'password',
              full_name_ar: 'مجدي محمود محمد حامد', full_name_en: 'Magdy Mahmoud Mohamed Hamed', role: :student, locale: :ar, phone: "+201111111#{i + 505}", date_of_birth: Date.today, status: :active, gender: :female, username: "user#{i + 505}")
end

# Major
Major.create([
               {
                 description_ar: 'يختبر ويعالج صيانات الخطوط واللوحات الكهربائية والمعدات الالية الخاصة بالتحكم ، وقادر على تنفيذ واصلاح الشبكات الكهربائية والاليات ذات النوع الرقمي PLC. كما انه يعرف مبادى التشغيل واستخدمات الماكينات الكهربائية. بالاضافة الى ذلك يدرس كيفية تركيب وحدات الطاقة الشمسية.',
                 description_en: 'Tests and handles maintenance of lines, electrical panels and automatic control equipment, capable of implementing and repairing electrical networks and mechanisms of digital type PLC. He also knows the principles of operation and uses of electrical machines. In addition, it studies how to install solar energy units.',
                 name_ar: 'كهرباء',
                 name_en: 'Electricity',
                 status: 'active'
               },
               {
                 description_ar: 'تصميم القطع الميكانيكية ايضاً باستخدام التحكم الرقمى CNC ، العمل على ماكينات مبرمجة وغير مبرمجة ، صيانة وتركيب اجهزة التشغيل، يعرف ايضاً العناصر العامة للالكترونيات والحاسب الالى لاستخدامها فى التحكم الالى، القدرة على قراءة التصميمات الفنية.',
                 description_en: 'Mechanical parts design also using CNC numerical control, working on programmed and non-programmed machines, maintenance and installation of operating devices, also known as general elements of electronics and computer for use in automatic control, ability to read technical designs.',
                 name_ar: ' ميكانيكا خراطة',
                 name_en: 'Turning mechanics',
                 status: 'active'
               },
               {
                 description_ar: 'يختبر ويعالج صيانات الخطوط واللوحات الكهربائية والمعدات الالية الخاصة بالتحكم ، وقادر على تنفيذ واصلاح الشبكات الكهربائية والاليات ذات النوع الرقمي PLC. كما انه يعرف مبادى التشغيل واستخدمات الماكينات الكهربائية. بالاضافة الى ذلك يدرس كيفية تركيب وحدات الطاقة الشمسية.',
                 description_en: 'Able to disassemble and install the mechanical parts of the car, make the engine overhaul, use the malfunction detection device. It is also capable of handling car faults, perfecting technical drawing.',
                 name_ar: ' ميكانيكا سيارات',
                 name_en: 'Car mechanics',
                 status: 'active'
               },
               {
                 description_ar: 'يجيد جميع انواع اللحام : اكسجين وكهرباء ولحام انابيب بترول ، لحام ثانى اكسيد الكربون وارجون . تجهيز وتركيب معدات اللحام اتقان الرسم الفنى، تصنيع اثاثات معدنية ،  يعرف ايضاً العناصر العامة من الحاسب.',
                 description_en: 'Fluent in all types of welding: oxygen, electricity, petroleum pipe welding, carbon dioxide and argon welding. Preparing and installing welding equipment, mastering the technical drawing, manufacturing metal furniture, also known as the general elements of the computer.',
                 name_ar: 'ميكانيكا خراطة ولحام',
                 name_en: 'Mechanics of turning and welding',
                 status: 'suspended'
               }
             ])
