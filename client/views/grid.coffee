define ['react'], (React) ->
  {div} = React.DOM

  row: React.createClass
    render: ->
      @transferPropsTo
      (div className: 'row', @props.children)

  column: React.createClass
    render: ->
      @transferPropsTo
      (div className: 'col-md-' + @props.span, @props.children)

