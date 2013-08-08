# encoding: utf-8
module OrdersHelper
  def generate_pdf order
    Prawn::Document.new do
      image 'lib/certificate_backgrounds/obrazec_big.jpg', at: [-36,755], width: 620, height: 795                               

      font_families.update(
        "Verdana" => {
          bold: "lib/fonts/verdanab.ttf",
          italic: "lib/fonts/verdanai.ttf",
          normal: "lib/fonts/verdana.ttf" 
        })
      font "Verdana"
      fill_color 'ff0000'

      text_box "#{TypeOfCertificate.find(order.type_of_certificate_id).title}", size: 14, at: [-36,470], align: :center, width: 620
      text_box "#{TypeOfLegalEntity.find(order.type_of_legal_entity_id).full_title}", size: 14, at: [-36,450], align: :center, width: 620
      text_box "Наименование компании: #{order.company}", size: 14, at: [-36,430], align: :center, width: 620

      f = 0
      order.list_of_works_categories.map(&:title).each do |category|
        text_box "#{category}", size: 10, at: [40,355-f], width: 400
        f += 20
      end
    end.render
  end
end
