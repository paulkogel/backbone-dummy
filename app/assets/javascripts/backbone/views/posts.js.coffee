class DB.Views.Posts extends Backbone.View
  tagName: 'section'
  className: 'm-posts'
  initialize: ->
    _.bindAll @, 'render'
    @template = JST['posts/index']
    @collection.bind 'reset', @render
    @collection.bind 'add', @render
  render: ->
    $(@el).html(@template())
    $posts = @.$('.m-posts--list')
    @collection.each (post) ->
      view = new DB.Views.PostBox
        model: post
        collection: @collection
      $posts.append view.render().el
    @
