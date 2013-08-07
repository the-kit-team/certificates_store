# encoding: utf-8
module OrdersHelper
  def generate_pdf order
    Prawn::Document.new do
      font_families.update(
        "Verdana" => {
          bold: "lib/fonts/verdanab.ttf",
          italic: "lib/fonts/verdanai.ttf",
          normal: "lib/fonts/verdana.ttf" 
        })
      font "Verdana"

      text "Сертификат #{TypeOfCertificate.find(order.type_of_certificate_id).title}", align: :center, style: :bold
      text ""
      text "Тип юридического лица: #{TypeOfLegalEntity.find(order.type_of_legal_entity_id).title}"
      text "Наименование компании: #{order.company}"
      text "в лице: #{order.creator_name}"
      text "Юридический адресс: #{order.registered_address}"
      text "Фактический адресс: #{order.actual_address}"
      text "Адресс на английском: #{order.address_on_english}"
      text "Телефоннный номер: #{order.phone}"
      text "Номер факса: #{order.fax}"
      text "Адресс электропочты: #{order.email}"
      text "ИНН: #{order.inn}"
      text "КПП: #{order.kpp}"
      text "ОГРН: #{order.ogrn}"
      text "Наименование банка: #{order.bank}"
      text "Номер счёта: #{order.current_account}"
      text "Корреспонденский счёт: #{order.correspondent_account}"
      text "БИК: #{order.bik}"
      text "Представитель банка: #{order.bank_person}"
      text "Имена аудиторов: #{order.auditors_names}"
    
      text "Перечень работ:"
      order.list_of_works_categories.map(&:title).each do |category|
        text "   #{category}"
      end
    end.render
  end
end
