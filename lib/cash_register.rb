require "pry"

class CashRegister
    attr_reader :items
    attr_accessor :discount, :total, :last_price


    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_price = 0
    end

    def total
        @total
    end
    
    

    def add_item(title, price, quantity=1)
        self.total += (quantity * price)
        quantity.times do 
            @items << title   
        end
        self.last_price = price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.total * self.discount / 100) # (@total * (@discount / 100)) didn't work because 100 wasn't a float (needed 100.0)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total -= self.last_price
    end

end

