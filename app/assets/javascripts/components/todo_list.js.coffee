
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
          'React + Bootstrap'

      React.createElement Projects, projects: @props.data

      h4
        className: 'text-center'
        'by ikukhar '
        a
          href: 'http://github.com/ikukhar'
          'ikukhar'
