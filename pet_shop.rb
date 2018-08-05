def pet_shop_name(arr_name)
  return arr_name[:name]
end

def total_cash(arr_name)
  return arr_name[:admin][:total_cash]
end

def add_or_remove_cash(arr_name, amount)
  arr_name[:admin][:total_cash] += amount
end

def pets_sold(arr_name)
  return arr_name[:admin][:pets_sold]
end

def increase_pets_sold(arr_name, number)
  arr_name[:admin][:pets_sold] += number
end

def stock_count(arr_name)
  return arr_name[:pets].length
end

def pets_by_breed(arr_name, req_breed)
  result = []
  x = 0
  for pet in @pet_shop
    if arr_name[:pets][x][:breed] == req_breed
      result << arr_name[:pets][x][:name]
      x += 1
    end
  end
  return result
end

def find_pet_by_name(arr_name, name)
  for pet in arr_name[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(arr_name, name)
    for pet in arr_name[:pets]
      arr_name[:pets].delete(pet) if pet[:name] == name
    end
end

def add_pet_to_stock(arr_name, new)
  arr_name[:pets] << new
end

def customer_cash(arr_name)
  return arr_name[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
  return customer
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(cust, new)
  cust[:pets] << new
end

def customer_can_afford_pet(cust, new)
  return false if cust[:cash] < new[:price]
  return true
end

def sell_pet_to_customer(arr_name, pet, cust)
  # afford = cust[:cash] < pet[:price]
  # if afford = false
  #   return false
  # end
  if pet != nil
    if customer_can_afford_pet(cust, pet)
      remove_customer_cash(cust, pet[:price])
      add_or_remove_cash(arr_name, pet[:price])
      remove_pet_by_name(arr_name, pet)
      add_pet_to_customer(cust, pet)
      increase_pets_sold(arr_name, 1)
    end
  end
  return false
end
