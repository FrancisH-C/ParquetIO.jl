# because isnothing exsits in 1.1 but not in 1.0
function isnothing(x::Any)
	return x == nothing
end
