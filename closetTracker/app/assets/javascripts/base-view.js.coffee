class Closet.BaseView extends Backbone.View

  constructor: ->
    super
    @subViews = []
  
  # Override remove to take into account subviews
  cleanUp: ->
    @cleanUpSubViews() if @subViews.length > 0
    @remove()

  cleanUpSubViews: ->
    for view in @subViews
      if view.cleanUp
        view.cleanUp()
      else
        view.remove()
    @subViews = []

  delegateTriggers: (obj, eventNames) =>
    # Binds obj events to triggers on the current view.
    # When the object passed fires an event, the view will fire an
    # event with the same name. 
    # This is used to propagate events from child to parent view.
    for event in eventNames
      @listenTo(obj, event, @trigger.bind(@, event))
