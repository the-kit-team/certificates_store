module MailHelper
  def generate_invoice_pdf(order)
    Prawn::Document.new do
      font_families.update(
        "Verdana" => {
          bold: "lib/fonts/verdanab.ttf",
          italic: "lib/fonts/verdanai.ttf",
          normal: "lib/fonts/verdana.ttf"
        })
      font "Verdana"

      text_box "#{order.type_of_certificate.title}", size: 14, at: [-36,470], align: :center, width: 620
      text_box "#{order.type_of_legal_entity.full_title}", size: 14, at: [-36,450], align: :center, width: 620
      text_box "Наименование компании: #{order.company}", size: 14, at: [-36,430], align: :center, width: 620

      f = 0
      order.list_of_works_categories.map(&:title).each do |category|
        text_box "#{category}", size: 10, at: [40,355-f], width: 400
        f += 20
      end
    end.render
  end
  
  def generate_list_of_order_pdf(order)
    Prawn::Document.new do
      font_families.update(
        "Verdana" => {
          bold: "lib/fonts/verdanab.ttf",
          italic: "lib/fonts/verdanai.ttf",
          normal: "lib/fonts/verdana.ttf"
        })
      font "Verdana", size: 14
      
      text " "
      text "Анкета", size: 18, align: :center, font: :bold
      text "Данная анкета необхадима для подтверждения правильности данных для сертификата.", align: :center
      text "Тип необходимого сертификата: #{order.type_of_certificate.title}"
      text "Тип юридического лица: #{order.type_of_legal_entity.full_title}"
      text "Наименование компании: #{order.company}"
      text "Телефон: #{order.phone}"
      text "Факс: #{order.fax}"
      text "Электронный адресс: #{order.email}"
      text "Индиыидуальный налоговый номер: #{order.inn}"
      text "Имя составителя: #{order.creator_name}"
      text "Имена аудиторов: #{order.auditors_names}"
      text "Представитель банка: #{order.bank_person}"
      text "БИК: #{order.bik}"
      text "Корреспонденский счёт: #{order.correspondent_account}"
      text "Расчётный счёт: #{order.current_account}"
      text "Наименование банка: #{order.bank}"
      text "ОГРН: #{order.ogrn}"
      text "КПП: #{order.kpp}"
      text "Адресс на английском: #{order.address_on_english}"
      text "Фактический адресс: #{order.actual_address}"
      text "Юридический адресс: #{order.registered_address}"
      
      text "Перечень работ: "
      order.list_of_works_categories.map(&:title).each do |category|
        text "#{category}", size: 10
      end
      
      text " "
      text "Дата: __________ Подпись: ____________ Печать: ___________", align: :right, font: :bold
    end.render
  end
end