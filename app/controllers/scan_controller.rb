class ScanController < ApplicationController
  def new
  end

  def create
    @qr = RQRCode::QRCode.new( 'my string to generate', :size => 4, :level => :h )
  end

private
  def scan
   return params.require(:qr_code).permit(:text)
  end
end
