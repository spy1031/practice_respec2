class Cart

  PRICE = 100     # 每本書的單價是 100 元

  def add(items)
    @ordered_items = items.map{ |key,value| value }   # 把資料由 Hash 轉成陣列
  end

  def calculate    # 計算客戶所買的書本總價
    @ordered_items = @ordered_items.delete_if{ |i| i == 0 } # 刪除客戶沒有買的哈利波特集數
    
    total = 0
    while @ordered_items.size >  0
      if @ordered_items.size == 4       # 如果買了一組4集，要依原價打 15% 折扣
        total = total + 4 * PRICE * 0.85
        @ordered_items = @ordered_items.map {|item| item -1}
      elsif @ordered_items.size == 3       # 如果買了一組3集，要依原價打 10% 折扣
        total = total + 3 * PRICE * 0.90
        @ordered_items = @ordered_items.map {|item| item -1}
      elsif @ordered_items.size == 2       # 如果買了一組2集，要依原價打 5% 折扣
        total = total + 2 * PRICE * 0.95
        @ordered_items = @ordered_items.map {|item| item -1}
      else
        @ordered_items.each do |item|   # 如果只買了單集 1 本或多本，就原價計算
          total = total + item * PRICE
          
        end
        @ordered_items = @ordered_items.map {|item| 0}
      end

      @ordered_items = @ordered_items.delete_if{ |i| i == 0 } # 刪除客戶沒有買的哈利波特集數
    end
    return total
  end

end