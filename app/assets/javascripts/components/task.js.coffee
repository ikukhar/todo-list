

{a,i, div, ul, li, input, form, h5, label} = React.DOM

@Task = React.createClass

  getInitialState: ->
    name:       @props.task.name
    status:     @props.task.status
    project_id: @props.project.id

  getDefaultProps: ->
    status: false

  changeStatus: (status) ->
    @replaceState status: status

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTask @props.task

  handleChangeStatus: (e) ->
    e.preventDefault()
    $.ajax
      method: 'PUT'
      url: "/tasks/#{ @props.task.id }"
      data: {task: {name: @state.name, status: not @state.status, project_id: @state.project_id}}
      dataType: 'JSON'
      success: () =>
        @changeStatus(not @state.status)

  render: ->
    div
      className: 'task'
      input
        onChange: @handleChangeStatus,
        type: 'checkbox',
        id: @props.task.id,
        name: @props.task.name,
        checked: (@state.status ? 'checked' : '') 
      h5 null,
        @props.task.name
      a
        className: 'btn btn-danger'
        onClick: @handleDelete
        'Delete'
