require 'awesome_print'
AwesomePrint.pry!

# Copy and paste sourced from: https://coderwall.com/p/qp2aha/ruby-pbcopy-and-pbpaste
def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  puts "copied to clipboard"
  true
rescue
  puts $!
end

def pbpaste
  `pbpaste`
end

Pry::Commands.block_command 'paste_eval', "Pastes from the clipboard then evals it in the context of Pry" do
  _pry_.input = StringIO.new(pbpaste)
end

class Jeff
  def self.admin; jj; end
  def self.last; jjt; end
end

def j
  OpenStruct.new(
    admin: Jeff.admin,
    last: Jeff.last
  )
end

def jj
  User.find_by_email('jeff@cognoa.com') rescue "can't find jeff@cognoa.com"
end

def jjt
  User.where("email LIKE 'jeff+%@cognoa.com'").last rescue "can't find any test accounts with pattern `jeff+%@cognoa.com`"
end

def ups
  @u = User.last
  @p = @u.current_profile
  @s = @p.submission
  [@u, @p, @s]
end

def ul
  User.last
end

def require_folder(folder = "spec/support/helpers")
  Dir[Rails.root.join("#{folder}/*.rb")].each{ |file| require file }
end

def bind_around
  begin
    yield
  rescue Exception => e
    ap e.inspect
    binding.pry
  end
end
# alias_method :pry_around, :bind_around
# alias_method :pry_ar, :bind_around
# alias_method :bind_ar, :bind_around
# alias_method :bindar, :bind_around
