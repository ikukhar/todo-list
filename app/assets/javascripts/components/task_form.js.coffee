
{div, span, button, i, input, form} = React.DOM

@TaskForm = React.createClass

  getInitialState: ->
    name:       ''
    status:     false
    project_id: @props.project.id

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/tasks/', {task: @state}, (data) =>
      @props.handleNewTask data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
      @state.name

  render: ->
    div
      className: 'row'
      div
        className: 'col-sm-10 col-sm-offset-1 task-height'
        div
          className: 'new-task-form'
          span
            className: 'input-group input-group-lg'
            span
              className: 'input-group-btn task-label'
              i
                className: 'glyphicon glyphicon-chevron-right'

            form
              onSubmit: @handleSubmit
              input
                className: 'form-control input-lg'
                type: 'text'
                placeholder: 'New task'
                value: @state.name
                name: 'name'
                onChange: @handleChange

            span
              className: 'input-group-btn'
              button
                onClick: @handleSubmit
                className: 'btn btn-default btn-lg side-btn'
                disabled: !@valid()
                i
                  className: 'glyphicon glyphicon-plus'
