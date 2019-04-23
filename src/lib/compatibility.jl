"""
`isnothing(x::Any)`

because isnothing exsits in 1.1 but not in 1.0
return true if value is nothing and false otherwise
"""
function isnothing(x::Any)
	return x == nothing
end
