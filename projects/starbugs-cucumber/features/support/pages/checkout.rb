require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_product_details(product)
        product_title = find('.item-details h1')
        expect(product_title.text).to eql product[:name]
    
        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:price]
    
        delivery = find('.delivery-price')
        expect(delivery.text).to eql product[:delivery]
    end

    def assert_total_price(total_price)
        price = find('.total-price')
        expect(price.text).to eql total_price
    end

    def find_zipcode(zipcode)
        find('input[name=cep]').set(zipcode)
        click_on 'Buscar CEP'
    end

    def fill_address(address)
        find('input[name=number]').set(address[:number])
        find('input[name=complement]').set(address[:details])
    end

    def choose_payment(payment_method)
        find('label div', text: payment_method.upcase).click
    end
    
    def confirm_order
        click_on "Confirmar pedido"
    end

    def apply_coupon(coupon)
        find('input[placeholder="Código do cupom"]').set(coupon)
        find('input[value="Aplicar"]').click
    end

    def assert_notice(notification)
        notice = find('p.notice')
        expect(notice.text).to eql notification
    end
end