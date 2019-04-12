module ScansHelper
  def generate_qr(text)
  require 'barby'
  require 'barby/barcode'
  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'

  if text == nil
    return
  else
  barcode = Barby::QrCode.new(text, level: :q, size: 9)
  base64_output = Base64.encode64(barcode.to_png({ xdim: 9 }))
  "data:image/png;base64,#{base64_output}"
  end
end
end
