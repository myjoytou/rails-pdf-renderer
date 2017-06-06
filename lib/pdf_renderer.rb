require "prawn"
ActionController::Renderers.add :pdf do |filename, options|
  pdf = Prawn::Document.new
  pdf.text render_to_string(options)
  # pdf.text render(options) # this does not work, find out why?
  send_data(pdf.render, filename: "#{filename}.pdf",
            disposition: "attachment")
end
module PdfRenderer
end
