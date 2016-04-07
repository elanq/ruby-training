arr = [0,1,1,2,3,4,5,5]
arr.each { |num|
  if num % 2 == 0
    puts "even number ==> #{num}" 
  else
    puts "odd number ==> #{num}" 
  end
}