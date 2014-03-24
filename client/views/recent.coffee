define ['react', 'moment', 'views/link'], (React, moment, Link) ->
  {div, span, strong, ul, li, br} = React.DOM

  Item = React.createClass
    render: ->
      id = @props.document.id
      title = @props.document.get('title') || 'Untitled'
      created = @props.document.createdAt
      (li {},
        (Link {href: "/item/#{id}"}, (strong {}, title))
        (div {}, moment(created).fromNow())
      )

  React.createClass
    render: ->
      (ul {className: 'recent list-inline'},
        @props.collection.map (document) ->
          (Item document: document)
      )
