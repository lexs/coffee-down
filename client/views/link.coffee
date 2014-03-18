define ['react', 'app'], (React, App) ->
  {a} = React.DOM

  React.createClass
    render: ->
      (a {href: @props.href, onClick: this.onClick}, @props.children)
    onClick: (e) ->
      App.router.navigate @props.href, {trigger: true}
      console.log 'hello'
      e.preventDefault()
