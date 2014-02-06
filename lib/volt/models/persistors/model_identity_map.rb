require 'volt/utils/generic_counting_pool'

# The identity map ensures that there is only one copy of a model
# used on the front end at a time.
class ModelIdentityMap < GenericCountingPool
  def create(*args)
    Model.new
  end
  
  # add extends GenericCountingPool so it can add in a model without
  # a direct lookup.  We use this when we create a model (without an id)
  # then save it and it gets assigned an id.
  def add(id, model)
    @pool[id] = [1, model]
  end
end