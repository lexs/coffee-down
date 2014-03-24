define ['p'], (Parse) ->
  model = {}

  model.Document = Parse.Object.extend
    className: 'document'
    defaults:
      title: ''
      text: ''

  model.Document.Recent = Parse.Collection.extend
    model: model.Document
    query: (new Parse.Query model.Document).descending('createdAt').limit 5

  model
