# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user = User.where(id: 1).first

# user.update(first_name: 'Mohamed', middle_name: 'A',last_name: 'Hassan')

# Account.create(user_id: 1,approved_by: 1, balance: 2000000)

# Pendingtransaction.create(to_user_id:2 , from_user_id:1, amount: 10, expdate: (Time.now + 5.days).to_i, seen: false, timestamp: Time.now.to_i)
# pen = Pendingtransaction.where(id: 1).first

# pen.update(to_user_id:1 , from_user_id:2, amount: 20, expdate: (Time.now + 5.days).to_i, seen: false, timestamp: Time.now.to_i)

# Friend.create(user_id: 1, friend_id: 2)
# Friend.create(user_id: 2, friend_id: 1)

# App.create(name: '123 Cart', user_id: 1, app_type: 'online shoping cart')

Payee.create(
    user_id: 1,
    payee_id: 2,
    info: {
        username: 'marco',
        fullname: 'Marco Polo',
        initial: 'MP',
        added: '20/12/2018'
    }
)