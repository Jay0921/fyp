user = User.find_or_initialize_by(email: 'admin@gmail.com', role: 'admin', username: 'Admin', phone: '+60188088888')
user.password = '123123'
user.save(validate: false)