#--
################################################################################
# Overwrite recode to work with DataFrame 
# (could be more general, but it's ok for now)
################################################################################
#--

"""
int128 ↦ string
"""
function int128_to_string(df::DataFrame)
	columns_name=names(df)
	for i in 1:length(columns_name)
		if (typeof(df[1, columns_name[i]]) <: Int128)
			try # try int128 ↦ string
				df[!, columns_name[i]] = string.(df[!, columns_name[i]]) 
			catch
			end
		end
        end
end


"""
string ↦ int128
"""
function string_to_int128(df::DataFrame)
    columns_name=names(df)
    for i in 1:length(columns_name)
        if (typeof(df[1, columns_name[i]]) <: String)
            try # try int128 ↦ string
		df[!, columns_name[i]] = parse.(Int128, df[!, columns_name[i]]) 
	    catch
	    end
	end
    end
end


"""
`CategoricalArrays.recode!(df::DataFrame, pairs::Pair)`

Recode every entry of a DataFrame

# Arguments
* `df` : a DataFrame
* `pair` : a recoding pair

# Examples
```
recode!(df, -1 => nothing)
recode!(df, missing => NaN)
```
"""
function CategoricalArrays.recode!(df::DataFrame, pair::Pair)
	new_type=typeof(pair[2])
	for i in 1:size(df)[2]
		# recode a given column
		old_type = eltype(df[:, i])
		df[!, i] = convert(Array{Union{old_type, new_type}}, df[!, i])
		recode!(df[!, i], pair::Pair)

		# If possible, remove the union and use only one type
		try
			df[!, i] = convert(Array{new_type}, df[:, i])
		catch
		end
		try
			df[!, i] = convert(Array{old_type}, df[:, i])
		catch
		end
	end
end


"""
`toNaN!(df::DataFrame, dummy=1::Any)`

putting a float (default=NaN) value instead of missing or nothing
"""
function toNaN!(df::DataFrame, float=NaN::Float64)
	recode!(df, missing => float)
	return df
end



"""
`todummy!(df::DataFrame, dummy=1::Any)`

putting dummy value (defaut=-1) instead of missing or nothing
"""
function todummy!(df::DataFrame, dummy=1::Any)
	recode!(df, missing => dummy)
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
end
