module ManagerHelper
  def get_lastname_and_abbreviation fullname
    fullname.match(/\A([[:word:]]+)+ ([[:word:]]+)+ ([[:word:]]+)+\z/) { |x| "#{x[1]} #{x[2][0]}.#{x[3][0]}." }
  end
end
