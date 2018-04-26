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
p asc
# ----- get input from user ------
#if one digit, digit has to include a 0
puts 'type the the characters you want to show as hexadecimals digits'
input = gets.chomp

# Create an array with input
arr = input.split('')
p arr

def hex_string(asc,arr,hex)
    s = []
    for i in 0..arr.length-1
        asc.each do |k,v|
            if k == arr[i]
                s.append(v)
                puts s
            end
        end
    end
end
