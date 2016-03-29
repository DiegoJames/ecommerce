class LinkMailer < ActionMailer::Base
  default from: "daoorellana@gmail.com"

  def download_link(link)
    @link = link
    @product = link.product
    mail(to: link.email,subject:"Descarga los productos que adquiriste en tiendus")
  end
end