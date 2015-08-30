
{a,i, div, ul, li, input, form, h2} = React.DOM

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
      className: 'project'
      li
        null
        @props.project.name
      a
        className: 'btn btn-danger'
        onClick: @handleDelete
        'Delete'
      div
        className: 'tasks'

        React.createElement Tasks, project: @props.project

