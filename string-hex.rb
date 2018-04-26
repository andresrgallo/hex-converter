# ----- defining Hex characters and ASCII ------
hex = {'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15}
asc_a = {}
26.times {|i| asc_a[('A'..'Z').to_a[i]] = i+1}
asc_b = {}
for i in 0..25
    asc_b[('a'..'z').to_a[i]] = i + 97
end
# Merge the to hashes asc_a and asc_b into one
asc = asc_a.merge(asc_b)
# Add space to asc hash
asc[' '] = 32

# ----- get input from user ------
#if one digit, digit has to include a 0
puts 'type the the characters you want to show as hexadecimals digits'
input = gets.chomp

# Create an array with input
arr = input.split('')

# Method to convert string input to hex pairs
def string_hex (x, y, z)
    # Array to store value for the result of the div of ascii value by 16 + the residue
    f = []
    s = []
    res = []
    for i in 0..y.length-1
        y.each  do |k,v|
            if k == x[i]
                a = v/16
                f.append(a)
                b = v  - a * 16
                if b < 9
                f.append(b)
                else
                    z.each do |k,v|
                        if v == b
                            b = k
                            f.append(b)
                        end
                    end
                end
            end
        end
    end
    return f
end

# Print solution
p "The hex pairs for the string '#{input}' are #{string_hex(arr, asc, hex).join().chars.each_slice(2).map(&:join).join(', ')}"
