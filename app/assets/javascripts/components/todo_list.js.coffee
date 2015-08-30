
{button,i, div, ul, li, input, form, h2} = React.DOM

@TodoList = React.createClass

  render: ->
    div
      className: 'todo-list'
      h2
        className: 'title'
        'React todo list'

      React.createElement Projects, projects: @props.data
