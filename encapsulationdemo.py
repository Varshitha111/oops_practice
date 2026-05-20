class Product:
    __price=0
    def set_price(self,price):
        if price>0:
            self.__price=price
    def apply_discount(self,discount):
        if discount>0 and discount<50:
            self.__price=self.__price-(self.__price*discount/100)
    def get_price(self):
        return self.__price
    
ob=Product()
ob.set_price(100)
ob.apply_discount(10)
print(ob.get_price())

class Mobile:
    __password="1234"
    def set_password(self,password):
        if len(password)>=4:
            self.__password=password
    def unlock(self,password):
        if password==self.__password:
            return "Mobile Unlocked"
        else:
            return "Incorrect Password"
    def change_password(self,old_password,new_password):
        if old_password==self.__password and len(new_password)>=4:
            self.__password=new_password
            return "Password Changed Successfully"
        else:
            return "Failed to Change Password"
m=Mobile()
m.set_password("5678")
print(m.unlock("5678"))
print(m.change_password("5678","abcd"))

class Employee:
    # __salary=0
    __designation=""
    def __init__(self):
        self.__salary=0
    def set_salary(self,salary):
        if salary>0:
            self.__salary=salary
    def set_designation(self,designation):
        self.__designation=designation
    def get_salary(self):
        return self.__salary
    def get_designation(self):
        return self.__designation
    def increment_salary(self,percentage):
        if percentage>0 and percentage<30:
            self.__salary=self.__salary+(self.__salary*percentage/100)
e=Employee()
e.set_salary(50000)
e.set_designation("Software Engineer")
print(f"Salary: {e.get_salary()}, Designation: {e.get_designation()}")
