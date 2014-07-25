class Closet.Collections.Outfits extends Backbone.Collection

  url: '/outfits'

  model: Closet.Models.Outfit

  removeIds: ->
    @contactId = ''
    @groupId = ''
    @url = '/outfits'

  setContactId: (id) ->
    @contactId = id
    @url = '/contacts/'+@contactId+'/outfits'

  setGroupId: (id) ->
    @groupId = id
    @url = '/groups/'+@groupId+'/groups'
