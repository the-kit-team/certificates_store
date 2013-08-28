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
      font "Verdana"
      
      text_box "Анкета", size: 18, at: [-36,740], align: :center, width: 620, font: :bold
      text_box "Данная анкета необхадима для подтверждения правильности данных для сертификата.", size: 14, at: [-36,720], align: :center, width: 620
      text_box "Тип необходимого сертификата: #{order.type_of_certificate.title}", size: 14, at: [0,680]
      text_box "Тип юридического лица: #{order.type_of_legal_entity.full_title}", size: 14, at: [0,660]
      text_box "Наименование компании: #{order.company}", size: 14, at: [0,640]
      text_box "Телефон: #{order.phone}", size: 14, at: [0,620]
      text_box "Факс: #{order.fax}", size: 14, at: [0,600]
      text_box "Электронный адресс: #{order.email}", size: 14, at: [0,580]
      text_box "Индиыидуальный налоговый номер: #{order.inn}", size: 14, at: [0,560]
      text_box "Имя составителя: #{order.creator_name}", size: 14, at: [0,540]
      text_box "Имена аудиторов: #{order.auditors_names}", size: 14, at: [0,520]
      text_box "Представитель банка: #{order.bank_person}", size: 14, at: [0,500]
      text_box "БИК: #{order.bik}", size: 14, at: [0,480]
      text_box "Корреспонденский счёт: #{order.correspondent_account}", size: 14, at: [0,460]
      text_box "Расчётный счёт: #{order.current_account}", size: 14, at: [0,440]
      text_box "Наименование банка: #{order.bank}", size: 14, at: [0,420]
      text_box "ОГРН: #{order.ogrn}", size: 14, at: [0,400]
      text_box "КПП: #{order.kpp}", size: 14, at: [0,380]
      text_box "Адресс на английском: #{order.address_on_english}", size: 14, at: [0,360]
      text_box "Фактический адресс: #{order.actual_address}", size: 14, at: [0,340]
      text_box "Юридический адресс: #{order.registered_address}", size: 14, at: [0,320]
      
      text_box "Перечень работ: ", size: 14, at: [0,300]
      f = 0
      order.list_of_works_categories.map(&:title).each do |category|
        text_box "#{category}", size: 10, at: [0,280-f], width: 600
        f += 18
      end
      
      text_box "Дата: __________ Подпись: ____________ Печать: ___________", size: 14, at: [-36,250-f], align: :right, width: 600, font: :bold
    end.render
  end
end