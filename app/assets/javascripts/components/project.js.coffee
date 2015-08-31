
{i, div, span, button, form, input} = React.DOM

@Project = React.createClass

  getInitialState: ->
    edit: false
    name: @props.project.name
    status: @props.project.status


  componentDidUpdate: (prevProps, prevState) ->
    unless @state.edit == prevState.edit
      if @state.edit
        $('#project-input-' + @props.project.id).focus()
      else
        $('#project-input-' + @props.project.id).blur()

  handleFocusOut: ->
    @setState edit: false

  handleChange: (e) ->
    @setState name: e.target.value

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/projects/#{ @props.project.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteProject @props.project

  handleSave: (e) ->
    e.preventDefault()
    $.ajax
      method: 'PUT'
      url: "/projects/#{ @props.project.id }"
      data: {project: {name: @state.name}}
      dataType: 'JSON'
      success: () =>
        @setState edit: false
        @props.handleSaveProject @props.project

  handleEdit: (e) ->
    @setState edit: true

  changeTasks: (tasks) ->
    cnt_false = 0
    for task in tasks
      cnt_false += 1 if task.status == false

    @setState status: cnt_false == 0 ? true : false 

  valid: ->
      @state.name


  render: ->
    div
      className: 'row'
      div
        className: 'col-sm-8 col-sm-offset-2'
        div
          className: 'project-form'
          div
            className: 'input-group input-group-lg'
            span
              className: 'input-group-btn'
              button
                className: 'btn btn-default btn-lg side-btn'
                onClick: @handleEdit
                i
                  className: 'glyphicon glyphicon-pencil'

            form
              onSubmit: @handleSave

              if @state.status
                input
                  id: 'project-input-'+@props.project.id
                  className: 'form-control input-lg done-project'
                  type: 'text'
                  value: @state.name
                  disabled: not @state.edit
                  onChange: @handleChange
                  onBlur: @handleFocusOut
              else
                input
                  id: 'project-input-'+@props.project.id
                  className: 'form-control input-lg'
                  type: 'text'
                  value: @state.name
                  disabled: not @state.edit
                  onChange: @handleChange
                  onBlur: @handleFocusOut

            span
              className: 'input-group-btn'
              if @state.edit
                button
                  className: 'btn btn-default btn-lg side-btn'
                  onClick: @handleSave
                  disabled: !@valid()
                  i
                    className: 'glyphicon glyphicon-floppy-disk'
              else
                button
                  className: 'btn btn-default btn-lg side-btn remove'
                  onClick: @handleDelete
                  i
                    className: 'glyphicon glyphicon-remove'

          React.createElement Tasks,
                              project: @props.project,
                              handleChangeTasks: @changeTasks

