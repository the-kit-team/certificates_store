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
end