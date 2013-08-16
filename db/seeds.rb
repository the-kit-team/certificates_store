# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.delete_all
Status.create([ 
  {id: 1, title: "New"},
  {id: 2, title: "Inwork"},
  {id: 3, title: "Isdone"},
  {id: 4, title: "Canceled"}
])
puts "Статусы:"
puts Status.all.map(&:title)

TypeOfLegalEntity.delete_all
TypeOfLegalEntity.create([ 
  {id: 1, title: "ООО", full_title: "Общество с ограниченной ответственностью"},
  {id: 2, title: "ИП", full_title: "Индивидуальный предприниматель"},
  {id: 3, title: "ЗАО", full_title: "Закрытое акционерное общество"},
  {id: 4, title: "ОАО", full_title: "Открытое акционерное общество"},
  {id: 5, title: "НП", full_title: "Некоммерческое партнерство"}
])
puts "Типы юридического лица:"
puts TypeOfLegalEntity.all.map { |e| "#{e.title} = #{e.full_title}" }

TypeOfCertificate.delete_all
TypeOfCertificate.create([ 
  {id: 1, title: "ГОСТ ISO 9001-2011 (ISO 9001:2008)"},
  {id: 2, title: "ГОСТ Р ИСО 14001-2007 (ISO 14001:2004)"},
  {id: 3, title: "ГОСТ Р 12.0.230-2007 (OHSAS 18001:2007)"},
  {id: 4, title: "ГОСТ Р ИСО/МЭК 27001-2006 (ISO/IEC 27001:2005)"},
  {id: 5, title: "SA 8000:2008"},
  {id: 6, title: "ISO 50001:2011"},
  {id: 7, title: "ISO 22000:2005"},
  {id: 8, title: "ISO 22301:2012"}
])
puts "Типы сертификатов:"
puts TypeOfCertificate.all.map(&:title)

ListOfWorksCategory.delete_all
categories = [
  '1. Виды работ по строительству, реконструкции и капитальному ремонту.',
  '1.1. Геодезические работы, выполняемые на строительных площадках.',
  '1.1.1. Разбивочные работы в процессе строительства.',
  '1.1.2. Геодезический контроль точности геометрических параметров зданий и сооружений.',
  '1.2. Подготовительные работы',
  '1.2.1. Разборка (демонтаж) зданий и сооружений, стен, перекрытий, лестничных маршей и иных конструктивных и связанных с ними элементов или их частей.',
  '1.2.2. Строительство временных: дорог; площадок; инженерных сетей и сооружений.',
  '1.2.3. Устройство рельсовых подкрановых путей и фундаментов (опоры) стационарных кранов.',
  '1.2.4. Установка и демонтаж инвентарных наружных и внутренних лесов, технологических мусоропроводов.',
  '2. Виды работ по разработке проектной документации.',
  '2.1. Работы по подготовке схемы планировочной организации земельного участка',
  '2.1.1. работы по подготовке генерального плана земельного участка',
  '2.1.2. работы по подготовке схемы планировочной организации трассы линейного объекта',
  '2.1.3. работы по подготовке схемы планировочной организации полосы отвода линейного сооружения.',
  '2.2. Работы по подготовке архитектурных решений.',
  '3. Виды работ по инженерным изысканиям',
  '3.1. Работы в составе инженерно-геодезических изысканий',
  '3.1.1. создание опорных геодезических сетей',
  '3.1.2. геодезические наблюдения за деформациями и осадками зданий и сооружений, движениями земной поверхности и опасными природными процессами',
  '3.1.3. создание и обновление инженерно-топографических планов в масштабах 1:200 - 1:5000, в том числе в цифровой форме, съемка подземных коммуникаций и сооружений',
  '3.1.4. трассирование линейных объектов',
  '3.1.5. инженерно-гидрографические работы',
  '3.1.6. специальные геодезические и топографические работы при строительстве и реконструкции зданий и сооружений'
]
categories.each do |e|
  ListOfWorksCategory.create( title: e )
end
puts "Категории перечьня работ:"
puts ListOfWorksCategory.all.map(&:title)

Permission.delete_all
Permission.create([ 
  {id: 1, title: "admin"},
  {id: 2, title: "manager"},
  {id: 3, title: "client"}
])
puts "Стандартные разрешения:"
puts Permission.all.map(&:title)

User.delete_all
User.create([ 
  {id: 1, email: "admin", password: "admin", password_confirmation: "admin", permission_id: 1},
  {id: 2, email: "manager", password: "manager", password_confirmation: "manager", permission_id: 2}
])
puts "Стандартные аккаунты:"
puts User.all.map(&:email)

# Тестирование нагрузки
Order.delete_all
<<<<<<< HEAD
Order.reset_primary_key
puts "Заказы для тестирования нагрузки:"
1000.times do |i|
  print '#' if (i % 10 == 0)
  Order.create(
    type_of_certificate_id: 1 + rand(8), 
    type_of_legal_entity_id: 1 + rand(5), 
    status_id: 1 + rand(4), 
    company: "Булыжник сервис", 
    creator_name: "Булыжников Юрий Андропович", 
    registered_address: "123456, Лондон, Пикадили 13", 
    actual_address: "123456, Лондон, Пикадили 13", 
    address_on_english: "123456, Landon, Pekkodilli 13", 
    phone: "1234567",
    fax: "1234567",
    email: "ya@ya.ru", 
    inn: "123456789", 
    kpp: "123456656", 
    ogrn: "254354235432", 
    bank: "Крупный", 
    current_account: "253545432534542353542657887", 
    correspondent_account: "31819875847591798579875984", 
    bik: "1347465788657842", 
    bank_person: "Евгений Михалыч Забоблоев", 
    auditors_names: "Петр Семёновыч Карабелов, Иван Сергеич Подводников, Михаил Михайлович Лодка"
  )
end
puts "Тысяча заказов загружена!"
=======
Order.create(
  id: 1,
  type_of_certificate_id: TypeOfCertificate.find_by_title("ГОСТ ISO 9001-2011 (ISO 9001:2008)").id, 
  type_of_legal_entity_id: TypeOfLegalEntity.find_by_title("ОАО").id, 
  status_id: Status.find_by_title("Новый").id, 
  company: "Булыжник сервис", 
  creator_name: "Булыжников Юрий Андропович", 
  registered_address: "123456, Лондон, Пикадили 13", 
  actual_address: "123456, Лондон, Пикадили 13", 
  address_on_english: "123456, Landon, Pekkodilli 13", 
  phone: "1234567",
  fax: "1234567",
  email: "ya@ya.ru", 
  inn: "123456789", 
  kpp: "123456656", 
  ogrn: "254354235432", 
  bank: "Крупный", 
  current_account: "253545432534542353542657887", 
  correspondent_account: "31819875847591798579875984", 
  bik: "1347465788657842", 
  bank_person: "Евгений Михалыч Забоблоев", 
  auditors_names: "Петр Семёновыч Карабелов, Иван Сергеич Подводников, Михаил Михайлович Лодка"
)
Order.first.list_of_works_category_ids = ListOfWorksCategory.first.id, ListOfWorksCategory.last.id
puts "Заказ:"
Order.all.map do |e| 
  puts "#{e.company}"
end
>>>>>>> master
