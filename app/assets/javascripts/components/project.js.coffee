
{i, div, span, button, form} = React.DOM

@Project = React.createClass

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/projects/#{ @props.project.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteProject @props.project

  render: ->
    div
      className: 'row'
      div
        className: 'col-sm-8 col-sm-offset-2'
        div
          classNames: 'input-group input-group-lg'
          span
            className: 'input-group-btn'
            button
              className: 'btn btn-success btn-lg'
              i
                classNames: 'fa fa-chevron-right'
          form
            onSubmit: @handleSubmit
            input
              className: 'form-control input-lg'
              type: 'text'
              value: @props.project.name
              name: 'name'
          span
            className: 'input-group-btn'
            button
              className: 'btn btn-default btn-lg destroy'
              i
                className: 'glyphicon glyphicon-remove'
          div
            className: 'tasks'

            React.createElement Tasks, project: @props.project

