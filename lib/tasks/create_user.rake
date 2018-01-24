desc "Create a first user for single tenant mode"
task :create_user => :environment do
  user = build_user
  if user.valid?
    user.save
    puts "The user is created"
  else
    puts "This user is not valid"
  end
end

def build_user
  print "Email: "
  email = STDIN.gets.chomp
  print "Password: "
  password = STDIN.noecho(&:gets).chomp
  puts
  User.new(email: email,
           password: password,
           admin: true)
end
