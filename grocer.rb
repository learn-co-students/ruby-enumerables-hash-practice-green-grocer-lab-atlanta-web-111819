def consolidate_cart(cart)
 list  = {}
 cart.each{|item|
 item_nam = item.keys[0]
 if list[item_nam]
   list[item_nam][:count] += 1
 else
   list[item_nam] = item[item_nam]
   list[item_nam][:count] = 1 
 end
 }
  return list
end

def apply_coupons(cart, coupons)
  coupons.each{|groc|
  coupons.each{|attribute, value|
  it = groc.keys[0]
  if cart[it] && cart[i][:count] >= groc[it][:num] 
    if cart["#{it} W/COUPON"]
      cart[it][:count] += 1 
    else
      cart["#{it} W/COUPON"] = {
      :price => groc[:cost] / item[:num],
      :clearance => cart[it][:clearance],
      :count => 1
      }
    end
    cart[it][:count] -= groc[it][:num]
  end
  }
  }
  return cart 
end

def apply_clearance(cart)
  cart.each {|item, att_hash|
  if att_hash[:clearance] == true 
    att_hash[:price] = (att_hash[:price] * 0.8).round(2)
  end
  }
  return cart
end

def checkout(cart, coupons)
  total = 0 
  con_cart = consolidate_cart(cart)
  af_coup = apply_coupons(con_cart, coupons)
  af_clearance = apply_clearance(af_coup)
  
  af_clearance.each {|item, it_hash|
  total += (it_hash[:price] * it_hash[:count])
  }
  
  if total > 100
    total = (total * 0.9)
  end
  return total 
end
