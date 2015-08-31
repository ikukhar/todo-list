
{div, h1, h4, hr, p, a} = React.DOM

@TodoList = React.createClass

  render: ->
    div
      className: 'container'
      h1
        className: 'text-center'
        'Todo List'
        p
          className: 'lead'
          'Rails + React + Bootstrap'

      React.createElement Projects, projects: @props.data
