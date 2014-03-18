define ['react', 'markdown'], (React, markdown) ->
  {div, span, h2} = React.DOM

  React.createClass
    getInitialState: ->
      html: markdown(@props.text)
    render: ->
      (div {},
        (h2 {}, 'Title')
        (span {dangerouslySetInnerHTML: {__html: @state.html}})
      )
