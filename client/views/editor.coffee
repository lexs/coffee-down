define ['react', 'app'], (React, App) ->
  {div, form, textarea, input, button} = React.DOM

  React.createClass
    getInitialState: ->
      text: @getText()
    componentDidMount: ->
      @props.document.on 'change', =>
        @setState text: @getText()
    render: ->
      (form className: 'editor', onChange: @handleChange,
        (input ref: 'title', defaultValue: @getTitle(), type: 'text', placeholder: "Title...")
        (textarea ref: 'editor', defaultValue: @getText())
        (button onClick: @onSave, 'Save')
      )
    handleChange: ->
      @props.document.set
        title: @refs.title.getDOMNode().value
        text: @refs.editor.getDOMNode().value
    onSave: (e) ->
      @props.document.save().then (document) ->
        App.navigate "item/#{document.id}"
      .then null, (err) ->
        console.log 'Failed to save document', err

      e.preventDefault()
    getTitle: -> @props.document.get('title')
    getText: -> @props.document.get('text')
