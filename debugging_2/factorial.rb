def factorial(n)
  product = 1
  while n > 0
    # Mystery new line!
    n -= 1
    product *= n
  end
  binding.irb
  product
end

p factorial(5)
