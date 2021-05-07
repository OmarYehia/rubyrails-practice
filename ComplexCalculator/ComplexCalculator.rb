class ComplexCalculator
    @@total_additions = 0
    @@total_multiplications = 0
    @@total_bulk_additions = 0
    @@total_bulk_multiplications = 0
    
    attr_accessor :real
    attr_accessor :imag

    def initialize(real=0, imag=0)
        @real = real
        @imag = imag
    end

    # Operator overloading
    def +(complex_number)
        return ComplexCalculator.new(
            @real + complex_number.real,
            @imag + complex_number.imag
        )
    end

    def *(complex_number)
        result = ComplexCalculator.new(
            (@real * complex_number.real) - (@imag * complex_number.imag),
            (@real * complex_number.imag) + (@imag * complex_number.real),
        )
    end
    
    def add(complex_number)
        @@total_additions += 1
        result = ComplexCalculator.new(
            @real + complex_number.real,
            @imag + complex_number.imag
        )
    end

    def self.bulk_add(complex_numbers)
        @@total_bulk_additions += 1
        total_real = 0
        total_imag = 0
        
        complex_numbers.each do |number|
            total_real += number.real
            total_imag += number.imag
        end
        
        result = ComplexCalculator.new(total_real, total_imag)
    end

    def multiply(complex_number)
        @@total_multiplications += 1
        result = ComplexCalculator.new(
            (@real * complex_number.real) - (@imag * complex_number.imag),
            (@real * complex_number.imag) + (@imag * complex_number.real),
        )
    end

    def self.bulk_multiply(complex_numbers)
        @@total_bulk_multiplications += 1
        total_real = 0
        total_imag = 0

        result = complex_numbers[0]

        for i in 1...complex_numbers.length
            @@total_multiplications -= 1
            result = result.multiply(complex_numbers[i])
        end

        return result
    end

    def value()
        puts "#{@real} + #{@imag}i"
    end

    def self.get_stats()
        puts "Total number of additions: #{@@total_additions}"
        puts "Total number of bulk additions: #{@@total_bulk_additions}"
        puts "Total number of multiplications: #{@@total_multiplications}"
        puts "Total number of bulk multiplications: #{@@total_bulk_multiplications}"
    end
end

c1 = ComplexCalculator.new(2, 3)
c2 = ComplexCalculator.new(2, 3)
c3 = ComplexCalculator.new(3, 2)
c4 = ComplexCalculator.new(1, 7)

puts (c1 + c2 + c3 + c4).inspect
puts (c1 * c2 * c3 * c4).inspect


# res_add = c1.add(c2)
# puts "Add 2, 3i to 2, 3i:"
# res_add.value


# res_mult = c3.multiply(c4)
# puts "Multiply 3, 2i to 1, 7i:"
# res_mult.value

# res_bulk_add = ComplexCalculator::bulk_add([c1, c2, c3, c4])
# puts "Bulk add"
# res_bulk_add.value

# res_bulk_multiply = ComplexCalculator::bulk_multiply([c1, c2, c3, c4])
# puts "Bulk multiply"
# res_bulk_multiply.value

# puts ""
# ComplexCalculator::get_stats()