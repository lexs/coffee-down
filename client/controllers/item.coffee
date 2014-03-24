define ['p', 'react', 'model', 'views/markdown', 'views/editor', 'views/recent'], (Parse, React, model, MarkdownView, Editor, RecentBar) ->
  {div, textarea} = React.DOM

  create: ->
    recent = new model.Document.Recent
    recent.fetch()
    .then (collection) ->
      new_document = new model.Document

      (div {},
        RecentBar collection: collection
        Editor document: new_document
      )
    .then null, (err) ->
      (div {}, 'Error: ' + err)
  show: (id) ->
    query = new Parse.Query model.Document
    (query.get id).then (document) ->
      MarkdownView text: document.get 'text'
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
      )
    .then null, (err) ->
      console.log 'ajaj', err, id


