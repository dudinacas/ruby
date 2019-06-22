# Pizza ordering service, formatting module
# Copyright (C) 2019 Zachary Picone
# This software is released through the GNU Affero General Public License, version 3. For more information, see the LICENSE file.

module Formatting

  def floatToCurrency(x)
    x = x.to_f # just in case an integer is given
    x_dp = x.to_s.split('.').last.size # converts to string, converts to array before dp and after, takes the decimal point value
    x = x.to_s # now converts to string
    if x_dp <= 2
      x = x + "0" * (2 - x_dp) # appends 0 onto end 2 - dp times
    end
    x = "$" + x # adds currency symbol and returns x
  end

  # add formatting names as capitalised names (eg. bruce von pipes - Bruce Von Pipes)

end
