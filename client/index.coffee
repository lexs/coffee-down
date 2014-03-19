define ['react', 'views'], (React, views) ->
  {div, a, h3} = React.DOM
  {Link} = views

  React.createClass
    render: ->
      (div {},
        (h3 {}, 'Index'),
        (Link {href: '/item/rv92lUnoKO'}, 'Go to item')
      )


