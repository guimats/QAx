Dado('que iniciei a compra do item:') do |table|
    @product = table.rows_hash
    @home.open
    @home.buy(@product[:name])
end
  
Quando('aplico o seguinte cupom: {string}') do |coupon|
    @checkout.apply_coupon(coupon)
end
  
Então('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.assert_total_price(final_price)
end

Então('devo ver a notifição: {string}') do |notification|
    @checkout.assert_notice(notification)
end

Então('o valor final da compra deve permancer o mesmo') do
    @checkout.assert_total_price(@product[:total])
end