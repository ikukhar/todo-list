
{div, span, button, a, i, input, form} = React.DOM

@ProjectForm = React.createClass

  getInitialState: ->
    name: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/projects/', {project: @state}, (data) =>
      @props.handleNewProject data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
      @state.name

  render: ->
    div
      className: 'row'
      div
        className: 'col-sm-8 col-sm-offset-2'
        div
          className: 'input-group input-group-lg'
          span
            className: 'input-group-btn project-label'
            i
              className: 'glyphicon glyphicon-chevron-right'

          form
            onSubmit: @handleSubmit
            input
              className: 'form-control input-lg'
              type: 'text'
              placeholder: 'New project'
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

