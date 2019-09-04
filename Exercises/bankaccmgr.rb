class Account

  def self.initIdCount
    @@id_identifier = 0
  end

  def initialize(amount, name)
    @id = @@id_identifier
    @@id_identifier += 1

    @amount = amount
    @name = name
  end

  def identify
    puts "ID: #@id. Name: #@name. Amount: #@amount. Type: #@type."
  end

  def credit(amount)
    @amount += amount
    puts "Account #@name, id #@id, has been credited for $#{amount}."
  end

  def debit(amount)
    @amount -= amount
    puts "Account #@name, id #@id, has been debited for $#{amount}."
  end
end

class CheckingAccount < Account

  def initialize(amount, name)
    @type = "CHQ"
    super(amount, name)
  end
end

class SavingsAccount < Account

  def initialize(amount, name)
    @type = "SAV"
    super(amount, name)
  end
end

class BusinessAccount < Account

  def initialize(amount, name)
    @type = "BUS"
    super(amount, name)
  end
end

Account.initIdCount

sav1 = SavingsAccount.new(50.0, "Bruce")
sav1.identify
chq1 = CheckingAccount.new(600.0, "Lisa Ann")
chq1.identify
bus1 = BusinessAccount.new(22.0, "Blueface")
bus1.identify

bus1.debit(50)
bus1.identify
