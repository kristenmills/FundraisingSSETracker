class FoodItem
  def initialize(hash, number)
    if (hash.length = 7)
      hash = upc_parity_fix(hash)
    end
    system("wget -q www.upcdatabase.com/item/#{hash}")
    file = File.open(hash)
    contents = file.read()
    if !(contents.include? "Description")
      @name = "invalid"
    else
      @name = contents.split("<tr><td>Description</td><td></td><td>")[1].split("</td>")[0]
    end
    @UPC = hash
    @number = number
    system("rm #{hash}")
  end

  def add(value=1)
    @number = @number + value
  end

  def sub()
    @number = @number - 1
  end
  
  def upc_parity_fix
  end
  
  def to_s()
    "#{@number}\t\"#{@name}\" (#{@UPC})"
  end
end