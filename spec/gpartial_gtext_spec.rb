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

require_relative "spec_require"

# Describe General::GText
# 
# Represents a plain text partial in a GTemplate
#
# Author:  Anshul Kharbanda
# Created: 7 - 1 - 2016
describe General::GText do
	before :all do
		@text = "foobar"
		@regex = "foobar"
		@partial = General::GText.new @text
	end

	# Describe General::GText::new
	# 
	# Creates the GText with the given match
	#
	# Parameter: match - the match object of the GText
	describe '::new' do
		it 'creates the GText with the given to_s representable object' do
			expect(@partial).to be_an_instance_of General::GText
			expect(@partial.name).to eql General::GText::PTNAME
			expect(@partial.instance_variable_get :@text).to eql @text
		end
	end

	# Describe General::GText#apply
	#
	# Returns the text
	#
	# Parameter: data - the data to apply to the partial
	#
	# Returns: the text
	describe '#apply' do
		it 'returns the GText string, given a hash of data' do
			expect(@partial.apply @hash).to eql @text
		end
	end

	# Describe General::GText#string
	#
	# Returns the text as a string
	#
	# Parameter: first - true if this partial is the first of it's kind in a GTemplate
	#
	# Returns: the text as a string
	describe '#string' do
		it 'returns the string representation of the GText' do
			expect(@partial.string).to eql @text
			expect(@partial.string true).to eql @text
			expect(@partial.string false).to eql @text
		end
	end

	# Describe General::GText#regex (depricated)
	# 
	# Returns the text as a regex
	#
	# Parameter: first - true if this partial is the first of it's kind in a GTemplate
	#
	# Returns: the text as a regex
	describe '#regex (depricated)' do
		it 'returns the regex representation of the GText' do
			expect(@partial.regex).to eql @regex
			expect(@partial.regex true).to eql @regex
			expect(@partial.regex false).to eql @regex
		end
	end
end