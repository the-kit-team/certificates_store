# encoding: utf-8
class CertificatePDF < Prawn::Document
  def generate_iso9000 order
    text "ИСО девять тысячь", align: :center
    text "Fax: #{order.fax}"
    text "Перечень работ:"
    order.list_of_works_categories.map(&:title).each do |category|
      text category
    end
    render
  end
end