define ['react', 'app', 'views/markdown', 'views/grid'], (React, App, MarkdownView, Grid) ->
  {div, form, textarea, input, button} = React.DOM
  {row, column} = Grid

  React.createClass
    getInitialState: ->
      text: @getText()

    componentDidMount: ->
      @props.document.on 'change', =>
        @setState text: @getText()

    render: ->
      text = @getText()
      (form className: 'editor form', onChange: @handleChange,
        (row {},
          (column span: 6, (input className: 'form-control title', ref: 'title',
          defaultValue: @getTitle(), type: 'text', placeholder: "Title..."))
          #(column span: 6, 'Preview')
        )
        (row {},
          (column span: 6,
            (textarea ref: 'editor', className: 'form-control', defaultValue: @getText())
            (button onClick: @onSave, 'Save'))
          (column span: 6, className: 'preview', @getPreview @getText())
        )
      )

    getPreview: (text) ->
      if text
        (MarkdownView text: text)
      else
        (div className: 'placeholder', 'Preview')

    handleChange: ->
      @props.document.set
        title: @refs.title.getDOMNode().value
        text: @refs.editor.getDOMNode().value

    onSave: (e) ->
      @props.document.save().then (document) ->
        App.navigate "/item/#{document.id}"
      .then null, (err) ->
        console.log 'Failed to save document', err

      e.preventDefault()

    getTitle: -> @props.document.get('title')
    getText: -> @props.document.get('text')
