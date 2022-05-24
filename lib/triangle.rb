require "pry"

class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end 

  def no_side_zero?
    a > 0 && b > 0 && c > 0
    # [a, b, c].all?(&:positive)
  end

  def triangle_inequality?
    a + b > c && b + c > a && a + c > b
  end
  
  def validate_triangle
      raise TriangleError unless no_side_zero? && triangle_inequality?
    end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else a != b && b != c 
      :scalene
    end
  end
  
    class TriangleError < StandardError
    def message
      "Sorry, the triangle is invalid. Try again."
    end
  end
end

