#--
################################################################################
# Overwrite recode to work with DataFrame 
# (could be more general, but it's ok for now)
################################################################################
#--

"""
`CategoricalArrays.recode!(df::DataFrame, pairs::Pair)`

Recode every entry of a DataFrame

# Arguments
* `df::DataFrame` : a DataFrame
* `pair::Pair` : a recoding pair

# Examples
```
recode!(df, -1 => nothing)
recode!(df, missing => -1)
```
"""
function CategoricalArrays.recode!(df::DataFrame, pairs::Pair)
	for i in 1:size(df)[2]
		recode!(df[i], pairs::Pair)
	end
end


"""
`todummy!(df)`

putting dummy value -1 instead of missing or nothing

# Arguments

* df::DataFrame
"""
function todummy!(df::DataFrame)
	recode!(df, missing => -1)
	recode!(df, nothing => -1)
	return df
end


"""
`tonothing!(df)`

changin dummy -1 or missing to nothing value

# Arguments

* df::DataFrame
"""
function tonothing!(df::DataFrame)
	recode!(df, -1 => nothing)
	recode!(df, missing => nothing)
end


"""
`tomissing!(df::DataFrame)`

changin dummy -1 or nothing to missing value 

# Arguments

* df::DataFrame
"""
function tomissing!(df::DataFrame)
	recode!(df, -1 => missing )
	recode!(df, nothing => missing )
end
