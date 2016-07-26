require_relative "support/csv_helper.rb"

begin
  require_relative "../app/controllers/orders_controller.rb"
  require_relative "../app/repositories/employees_repository.rb"
rescue LoadError => e
  describe "OrdersController" do
    it "You need a `orders_controller.rb` file for your `OrdersController`" do
      fail
    end
  end
end

describe "OrdersController" do
  let(:meals) do
    [
      [ "id", "name", "price" ],
      [ 1, "Margherita", 8 ],
      [ 2, "Capricciosa", 11 ],
      [ 3, "Napolitana", 9 ],
      [ 4, "Funghi", 12 ],
      [ 5, "Calzone", 10 ]
    ]
  end
  let(:meals_csv_path) { "spec/support/meals.csv" }
  let(:meals_repository) { MealsRepository.new(meals_csv_path) }

  let(:employees) do
    [
      [ "id", "username", "password", "role" ],
      [ 1, "paul", "secret", "manager" ],
      [ 2, "john", "secret", "delivery_guy" ]
    ]
  end
  let(:employees_csv_path) { "spec/support/employees.csv" }
  let(:employees_repository) { EmployeesRepository.new(employees_csv_path) }

  let(:customers) do
    [
      [ "id", "name", "address" ],
      [ 1, "Paul McCartney", "Liverpool" ],
      [ 2, "John Bonham", "Redditch" ],
      [ 3, "John Entwistle", "Chiswick" ],
    ]
  end
  let(:customers_csv_path) { "spec/support/customers.csv" }
  let(:customers_repository) { CustomersRepository.new(customers_csv_path) }

  let(:orders) do
    [
      [ "id", "delivered", "meal_id", "employee_id", "customer_id" ],
      [ 1, true,  1, 2, 1 ],
      [ 2, false, 1, 2, 2 ],
      [ 3, false, 2, 2, 3 ],
    ]
  end
  let(:orders_csv_path) { "spec/support/orders.csv" }
  let(:orders_repository) { OrdersRepository.new(orders_csv_path, meals_repository, employees_repository, customers_repository) }

  before(:each) do
    CsvHelper.write_csv(meals_csv_path, meals)
    CsvHelper.write_csv(employees_csv_path, employees)
    CsvHelper.write_csv(customers_csv_path, customers)
    CsvHelper.write_csv(orders_csv_path, orders)
  end

  it "should be initialized with a 4 repositories instance" do
    controller = OrdersController.new(meals_repository, employees_repository, customers_repository, orders_repository)
    expect(controller).to be_a(OrdersController)
  end

  describe "#list_undelivered_orders" do
    module Kernel; def gets; STDIN.gets; end; end

    it "should list undelivered orders (with meal, employee assigned and customer info)" do
      controller = OrdersController.new(meals_repository, employees_repository, customers_repository, orders_repository)
      orders.drop(2).each do |order|
        expect(STDOUT).to receive(:puts).with(/#{customers_repository.find(order[4]).name}/)
      end
      controller.list_undelivered_orders
    end
  end

  describe "#add" do
    module Kernel; def gets; STDIN.gets; end; end

    it "should ask the user for a meal, a customer and an employee to be assigned" do
      controller = OrdersController.new(meals_repository, employees_repository, customers_repository, orders_repository)

      # TODO: simulate gets the three indexes.

      controller.add
    end
  end
end
