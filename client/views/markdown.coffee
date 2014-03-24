define ['react', 'markdown'], (React, markdown) ->
  {div, span} = React.DOM

  React.createClass
    render: ->
      (div
        className: 'markdown'
        dangerouslySetInnerHTML:
          __html: markdown @props.text
      )
