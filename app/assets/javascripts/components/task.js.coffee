
{i, div, span, button, form, input} = React.DOM

@Task = React.createClass

  getInitialState: ->
    name:       @props.task.name
    status:     @props.task.status
    project_id: @props.project.id

  getDefaultProps: ->
    status: false

  changeStatus: (status) ->
    @setState status: status
    @props.handleChangeStatus @props.task, status

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
      className: 'row'
      div
        className: 'col-sm-10 col-sm-offset-1'
        div
          className: 'task-form'
          div
            className: 'input-group input-group-lg'
            span
              className: 'input-group-addon'
              input
                className: 'toggle'
                type: 'checkbox'
                checked: (@state.status ? 'checked' : '')
                onChange: @handleChangeStatus
                id: @props.task.id
            form
              onSubmit: @handleDelete
              if @state.status
                input
                  className: "form-control input-lg done-task"
                  type: 'text'
                  value: @props.task.name
                  disabled: true
              else
                input
                  className: "form-control input-lg"
                  type: 'text'
                  value: @props.task.name
                  disabled: true
            span
              className: 'input-group-btn'
              button
                onClick: @handleDelete
                className: 'btn btn-default btn-lg side-btn remove'
                i
                  className: 'glyphicon glyphicon-remove'
