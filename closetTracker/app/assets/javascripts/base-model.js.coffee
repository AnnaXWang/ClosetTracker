class Closet.BaseModel extends Backbone.Model

  get: (attr) ->
    # Overrites to allow for dynamic properties
    if typeof @[attr] == 'function'
      @[attr]()
    else
      Backbone.Model.prototype.get.call(@, attr)

  alias: ->
    # Regular alias
    Backbone.Model.prototype.get.call(@, 'alias') || @get('name')
