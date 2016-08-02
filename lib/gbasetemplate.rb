# General is a templating system in ruby
# Copyright (C) 2016  Anshul Kharbanda
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# General is a templating system in ruby
#
# Author: Anshul Kharbanda
# Created: 3 - 4 - 2016
module General
	# The base class for General template objects
	# Implementing objects must define a :apply method
	# Which applies the GTemplate to an object
	#
	# Author:  Anshul Kharbanda
	# Created: 7 - 30 - 2016
	class GBaseTemplate
		# Initializes the GBaseTemplate with the given string
		#
		# Parameter: string - the string to initialize the GBaseTemplate with
		def initialize string
			@partials = []
		end

		# Applies the given data to the template and returns the generated string
		#
		# Parameter: data - the data to be applied (as a hash. merges with defaults)
		#
		# Return: string of the template with the given data applied
		def apply(data={}); @partials.collect { |partial| partial.apply(data) }.join; end

		# Applies each data structure in the array independently to the template
		# and returns an array of the generated strings
		#
		# Parameter: array - the array of data to be applied 
		# 				     (each data hash will be merged with defaults)
		#
		# Return: array of strings generated from the template with the given 
		# 		  data applied
		def apply_all array
			array.collect { |data| apply(data) }
		end
	end
end