#TASK1

class School:
    def __init__(self, name):
        self.name = name
    def show_school(self):
        print(f"Welcome to {self.name} school")
class Teacher(School):
    def __init__(self,tname,tsubject,name):
        super().__init__(name)
        self.tname=tname
        self.tsubject=tsubject
    def show_teacher(self):
        print(f"{self.tname} is a teacher of {self.tsubject}")
class Student(Teacher):
    def __init__(self,sname,grade,tname,tsubject,name):
        super().__init__(tname, tsubject, name)
        self.sname=sname
        self.grade=grade
    def show_student(self):
        print(f"{self.sname} is a student of grade {self.grade}")
s=Student("Alice", "10th", "Mr. Smith", "Math", "Greenwood")
s.show_student()
s.show_school()
s.show_teacher()

# TASK2
# 🎯 Scenario: Food Delivery App
# 👉 Parent: User
# name
# location
# method → login()
# 👉 Child 1: Customer
# order_item
# method → place_order()
# 👉 Child 2: DeliveryPartner
# vehicle_type
# method → deliver_order()

# 🧑‍💻 Task:
# Create 1 customer and 1 delivery partner
# Use super()
# Show login + role-specific actions

class User:
    def __init__(self, name, location):
        self.name = name
        self.location = location
    def login(self):
        print(f"{self.name} logged in from {self.location}")
class Customer(User):
    def __init__(self, name, location, order_item):
        super().__init__(name, location)
        self.order_item = order_item
    def place_order(self):
        print(f"{self.name} placed an order for {self.order_item}")
class DeliveryPartner(User):
    def __init__(self, name, location, vehicle_type):
        super().__init__(name, location)
        self.vehicle_type = vehicle_type
    def deliver_order(self):
        print(f"{self.name} is delivering using {self.vehicle_type}")
customer = Customer("John Doe", "New York", "Pizza")
delivery_partner = DeliveryPartner("Jane Smith", "Los Angeles", "Motorcycle")

customer.login()
customer.place_order()
delivery_partner.login()
delivery_partner.deliver_order()