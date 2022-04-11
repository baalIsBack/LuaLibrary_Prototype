--[[ Usage:
local Prototype = require 'Prototype'

-- Create Instance of Prototype
local Car = Prototype:new("Car")

-- Create initialization method for Car
function Car:init(number_of_seats)
	-- Normal Constructor-like method
	self.number_of_seats = number_of_seats
	
	-- Always call the parent init method at the end of init to ensure that
	-- the object has been initialized with all attributes of the parents!
	Prototype.init(self)
	-- Return the initialized Prototype
	return self

	-- Alternatively
	-- return Prototype.init(self)
end

-- Testing function to show number of seats of any car
function Car:getNumberOfSeats()
	return self.number_of_seats
end

-- Create instance of Car; NOTE the second paranthesis, which calls the init method
local myCar = Car:new("myCar")(4)
local myOtherCar = Car:new("myOtherCar")(2)

	print( myCar:getNumberOfSeats() ) 	--> 4
	print( myCar.number_of_seats ) 		--> 4
	print( myOtherCar:getNumberOfSeats() ) 	--> 2
	print( myOtherCar.number_of_seats ) 	--> 2
--	print( Car:getNumberOfSeats() )         --> ERROR
	print( Car(1):getNumberOfSeats() )	--> 1
	print( Car(1) == Car(1)) 		--> False, since both are different instances of Car
--]]


local Prototype = {}
Prototype.__name = "Prototype"
local Prototype_mt = {}
Prototype_mt.__name = "Prototype_mt"
setmetatable(Prototype, Prototype_mt)

--[[Prototype Metatable]]
function Prototype_mt:__index(k)
	--error("Key '" .. k .. "in" .. t .. "' does not exist.")
end

function Prototype_mt:__tostring()
	return self.__name or "unnamed"
end
--[[/Prototype Metatable]]
--[[Prototype]]
--[[Prototype Metamethods]]
function Prototype:__index(k)
	return getmetatable(self)[k]
end

function Prototype:__call(self, ...)
	self:init(...)
end
--[[/Prototype Metamethods]]

function Prototype:new(new_name)
	local instance = {}
	setmetatable(instance, self)
	if new_name then
		instance:name(new_name)
	else
		instance:name("instance")
	end
	function instance:__index(k)
		return getmetatable(self)[k]
	end
	return instance
end

function Prototype:instanceof(object)
	if self == object then
		return true
	end
	local parent = getmetatable(self)
	if parent then
		return parent:instanceof(object)
	else
		return false
	end
end

function Prototype:init()
	return self
end


function Prototype:name(new_name)
	if new_name then
		self.__name = new_name
	end
	return self
end
--[[/Prototype]]
return Prototype
