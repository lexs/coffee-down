define ['p', 'react', 'model', 'views/markdown', 'views/editor'], (Parse, React, model, MarkdownView, Editor) ->
  {div, textarea} = React.DOM

  create: ->
    document = new model.Document

    (div {},
      Editor document: document
      MarkdownView document: document
    )

  show: (id) ->
    query = new Parse.Query model.Document
    (query.get id).then (document) ->
      MarkdownView document: document
    .then null, (err) ->
      console.log 'ajaj', err, id
      # TODO: Fix this
      MarkdownView()

  edit: (id) ->
    query = new Parse.Query model.Document
    (query.get id).then (document) ->
      document = document.clone()
      (div {},
        Editor document: document
        MarkdownView document: document
      )
    .then null, (err) ->
      console.log 'ajaj', err, id


