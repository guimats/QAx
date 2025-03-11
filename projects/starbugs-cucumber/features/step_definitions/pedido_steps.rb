Dado('que iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end
  
Quando('faço a busca do seguinte CEP: {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)
end
  
Quando('informo os demais dados do endereço:') do |table|
    @checkout.fill_address(table.rows_hash)
end
  
Quando('escolho a forma de pagamento {string}') do |payment_method|
    @checkout.choose_payment(payment_method)
end
  
Quando('por fim finalizo a compra') do
    @checkout.confirm_order
end
  
Então('sou redirecionado para a página de confirmação de Pedidos') do
    @order.assert_order
end
  
Então('deve ser informado o seguinte prazo de entrega: {string}') do |delivery_time|
    @order.assert_delivery_time(delivery_time)
end
