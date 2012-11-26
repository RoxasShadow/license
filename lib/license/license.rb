#--
# This file is part of License.
#
# Copyright(C) 2012 Giovanni Capuano <webmaster@giovannicapuano.net>
#
# License is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# License is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with License.  If not, see <http://www.gnu.org/licenses/>.
#++
class License

  def self.get_list(directory)
    Dir.entries(directory).delete_if { |d| !d.end_with? '.txt' }
  end
  
  def self.get(options)
    license = File.read File.join(options[:directory], options[:license] + '.txt')
    
    options.each_key { |key|
      license.gsub!(/{#{key}}/, options[key.to_sym].to_s)
    }
    
    Languages.send options[:language].downcase.to_sym, license, options[:spaces]
  end
  
end