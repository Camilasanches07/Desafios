require_relative "vending_machine"

def display(vending_machine)
  return "---> Amount: #{vending_machine.amount_cents / 100.0}€" \
    " - 1 Snack = #{vending_machine.snack_price_cents / 100.0}€" \
    " - Stock: #{vending_machine.snacks}"
end

# We instantiate a new vending machine selling 2.5 euros snacks. In the beginning
# this machine has a stock of 10 snacks.
vending_machine = VendingMachine.new(250, 10)
puts "Vending machine ready!"
puts display(vending_machine)

# A client comes and inserts some coins
puts "Inserting 2€"
vending_machine.insert_coin(200)
puts display(vending_machine)

3.times do
  puts "Inserting 0.2€"
  vending_machine.insert_coin(20)
  puts display(vending_machine)
end

# Then the client pushes the Buy snack button
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts display(vending_machine)

# Then the client pushes the Buy snack button again (but forgot to insert some more coins!)
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snack
puts display(vending_machine)
