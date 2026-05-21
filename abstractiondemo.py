from abc import ABC, abstractmethod
class UPIPayment(ABC):
    @abstractmethod
    def pay(self, amount):
        pass
    @abstractmethod
    def check_balance(self):
        pass
class PhonePe(UPIPayment):
    def __init__(self):
        self.balance = 5000
    def pay(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            print(f"Paid ₹{amount} using PhonePe")
        else:
            print("Insufficient Balance in PhonePe")
    def check_balance(self):
        print(f"PhonePe Balance: ₹{self.balance}")
class GooglePay(UPIPayment):
    def __init__(self):
        self.balance = 3000
    def pay(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            print(f"Paid ₹{amount} using Google Pay")
        else:
            print("Insufficient Balance in Google Pay")
    def check_balance(self):
        print(f"Google Pay Balance: ₹{self.balance}")
class Paytm(UPIPayment):
    def __init__(self):
        self.balance = 4000
    def pay(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            print(f"Paid ₹{amount} using Paytm")
        else:
            print("Insufficient Balance in Paytm")
    def check_balance(self):
        print(f"Paytm Balance: ₹{self.balance}")
p1 = PhonePe()
g1 = GooglePay()
p2 = Paytm()
p1.pay(1000)
p1.check_balance()
g1.pay(500)
g1.check_balance()
p2.pay(2000)
p2.check_balance()