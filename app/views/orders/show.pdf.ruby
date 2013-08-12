def prawn_document(opts={})
  download = opts.delete(:force_download)
  pdf = (opts.delete(:renderer) || Prawn::Document).new(opts)
  yield pdf if block_given?
  pdf.render
end

prawn_document() do |pdf|
  pdf.font_families.update(
    "Verdana" => {
      bold: "lib/fonts/verdanab.ttf",
      italic: "lib/fonts/verdanai.ttf",
      normal: "lib/fonts/verdana.ttf" 
    })
  pdf.font "Verdana"
  
  #pdf.image 'lib/certificate_backgrounds/obrazec_big.jpg', at: [-36,755], width: 620, height: 795
  
  pdf.fill_color 'cc0000'
  pdf.text_box "#{TypeOfCertificate.find(@order.type_of_certificate_id).title}", size: 14, at: [-36,470], align: :center, width: 620
  pdf.text_box "#{TypeOfLegalEntity.find(@order.type_of_legal_entity_id).full_title}", size: 14, at: [-36,450], align: :center, width: 620
  pdf.text_box "Наименование компании: #{@order.company}", size: 14, at: [-36,430], align: :center, width: 620

  f = 0
  @order.list_of_works_categories.map(&:title).each do |category|
    pdf.text_box "#{category}", size: 10, at: [40,355-f], width: 400
    f += 20
  end
end