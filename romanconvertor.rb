ROMAN_MAP = { 1000 => "M",
              900 => "CM",
              500 => "D",
              400 => "CD",
              100 => "C",
              90 => "XC",
              50 => "L",
              40 => "XL",
              10 => "X",
              9 => "IX",
              5 => "V",
              4 => "IV",
              1 => "I" }

def fromRoman(romanNumber)
  total =0
  i=0
  while i < romanNumber.length-1
    if ROMAN_MAP.value?(romanNumber[i])
      if ROMAN_MAP.key(romanNumber[i + 1]) > ROMAN_MAP.key(romanNumber[i])
        total -= ROMAN_MAP.key(romanNumber[i])
      else
        total += ROMAN_MAP.key(romanNumber[i])
      end
    else
      raise TypeError
    end
    i += 1
  end
  return total+=ROMAN_MAP.key(romanNumber[-1])
end

def toRoman(arabicNumber)
    if arabicNumber < 1 || arabicNumber > 3999
      raise RangeError
    else
      result = ""
      ROMAN_MAP.keys.each do |i|
        quotient, mod = arabicNumber.divmod(i)
        result << ROMAN_MAP[i] * quotient
        arabicNumber = mod
      end
      return result
    end
end