define ['react', 'app'], (React, App) ->
  {a} = React.DOM

  React.createClass
    render: ->
      (a {href: @props.href, onClick: this.onClick}, @props.children)
    onClick: (e) ->
      App.navigate @props.href
      e.preventDefault()
