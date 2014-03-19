define ['react', 'p', 'markdown', 'model'], (React, Parse, markdown, model) ->
  {div, span, h2} = React.DOM

  React.createClass
    #getInitialState: ->
    #  loaded: false
      #html: markdown(@props.text)
    #componentDidMount: ->

    render: ->
      if @props.loaded
        text = @props.document.get('text')
        (div {},
          (h2 {}, 'Title')
          (span {dangerouslySetInnerHTML: {__html: markdown(text)}})
        )
      else
        (div {}, 'Error')
