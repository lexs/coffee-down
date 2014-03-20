define ['controllers/item', 'index'], (ItemController, Index) ->
  '/': ItemController.create
  '/item/:id': ItemController.show
  '/item/:id/edit': ItemController.edit
