define ['p', 'model', 'index', 'item', 'views/document'], (Parse, model, Index, Item, Document) ->
  '/': ->Index()
  '/item/:id': (id) ->
    query = new Parse.Query model.Document
    (query.get id).then (document) ->
      Document loaded: true, document: document
    .then null, (err) ->
      console.log 'ajaj', err, id
      Document loaded: false


