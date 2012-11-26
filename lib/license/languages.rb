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
class Languages

  def self.ruby(license, spaces)
    sub = ?# + (' ' * spaces)
    return "#--\n" + sub + license.gsub(/\n/, "\n#{sub}") + "\n#++"
  end

  def self.asm(license, spaces)
    return license.gsub(/\n/, "\n%" + (' ' * spaces))
  end
  
  def self.c(license, spaces)
    sub = ?* + (' ' * spaces)
    "/*\n" + sub + license.gsub(/\n/, "\n#{sub}") + "\n*/"
  end
  
  class << self
    alias_method :perl,   :ruby
    alias_method :erlang, :asm
  end
  
  def self.method_missing(m, *args, &block)
    c args[0], args[1]
  end
  
end