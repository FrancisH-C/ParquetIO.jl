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
* `df` : a DataFrame
* `pair` : a recoding pair

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
`todummy!(df::DataFrame, dummy=1::Any)`

putting dummy value (defaut=-1) instead of missing or nothing
"""
function todummy!(df::DataFrame, dummy=1::Any)
	recode!(df, missing => dummy)
	recode!(df, nothing => dummy)
	return df
end


"""
`tonothing!(df::DataFrame, dummy=1::Any)`

changin dummy value (defaut=-1) or missing to nothing value
"""
function tonothing!(df::DataFrame, dummy=1::Any)
	recode!(df, dummy => nothing)
	recode!(df, missing => nothing)
end


"""
`tomissing!(df::DataFrame, dummy=1::Any)`

changin dummy value (defaut=-1) or nothing to missing value 
"""
function tomissing!(df::DataFrame, dummy=1::Any)
	recode!(df, dummy => missing )
	recode!(df, nothing => missing )
end
