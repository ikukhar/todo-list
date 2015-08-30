
{button,i, div, ul, li, input, form, h2} = React.DOM

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
    form
      className: 'form-inline'
      onSubmit: @handleSubmit
      div
        className: 'form-group'
        input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create task'


