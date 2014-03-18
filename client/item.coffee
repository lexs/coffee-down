define ['react'], (React) ->
  {div, a, h3} = React.DOM

  React.createClass
    render: ->
      (div {},
        (h3 {}, 'Item ' + @props.id),
      )


