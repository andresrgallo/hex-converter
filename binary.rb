class HexConverter
    # ----- defining ASCII values ------
    def ascii
        asc_a = {}
        26.times {|i| asc_a[('A'..'Z').to_a[i]] = i+1}
        asc_b = {}
        for i in 0..25
            asc_b[('a'..'z').to_a[i]] = i + 97
        end
        asc = asc_a.merge(asc_b)    # Merge the to hashes asc_a and asc_b into one
        asc[' '] = 32   # Add space to asc hash
        asc
    end

    # ----- get input from user, if one digit, digit has to include a 0 -----
    def user_input
        puts 'type the hex number'
        input = gets.chomp.upcase
        input.gsub!(/\s+/, '')   #Get rid of empty spaces if any
        arr = input.chars.each_slice(2).map(&:join)    # Separate input into pairs and build an array
        arr
    end

    # ----  Method to calculate the decimal value for first digit
    #  and store it in hash h with the key as the input -------
    def hex_conv
        arr = user_input
        h = {}
        v = []    # Calculate the decimal value for the second digit and store it v
        for i in 0..((arr.length)-1)
            if arr[i] == "20"
                h[i] = 32
                v.append(0)
            else
                arr[i][0].to_i > 0 ? h[i] = arr[i][0].to_i * 16 : h[i] = 0
                val = arr[i][1].to_i > 0 ? arr[i][1].to_i : consont(arr[i])   # Check if 2 digit is an integer or a letter
                v.append(val)
            end
        end
        r = []   # Store the sum of the hash values plus the values of v array
        for i in 0..(v.length-1)
            r << h.values[i] + v[i]
        end
        return r
    end

    # ------ Method to get the value of the constant of a hex pair -----
    def consont(arr)
        hex_letter = {'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15}
        hex_letter.each  do |k,v|
            if k == arr[1]
                val = v
            return val
        end
        end
    end

    # ---- Method to convert the decimal values into ASCII -----
    def code
        n = hex_conv
        asc = ascii
        res = []
        n.each do |a|
            asc.each do |k,v|
                if a == v
                    res << k
                end
            end
        end
        res = res.join('')
        # return res
        puts "the string convertion from the hex code is '#{res}' " # The result as a string
    end
end

test = HexConverter.new
test.code
