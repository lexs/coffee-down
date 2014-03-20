define ['react', 'markdown'], (React, markdown) ->
  {div, span} = React.DOM

  React.createClass
    getInitialState: ->
      text: @getText()
    componentDidMount: ->
      @props.document.on 'change', =>
        @setState text: @getText()
    render: ->
      (div {className: 'markdown'},
        (span {dangerouslySetInnerHTML: {__html: markdown(@state.text)}})
      )
    getText: -> @props.document.get('text')
