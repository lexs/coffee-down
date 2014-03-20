define ['p'], (Parse) ->
  Document: Parse.Object.extend
    className: 'document'
    defaults:
      title: ''
      text: ''
