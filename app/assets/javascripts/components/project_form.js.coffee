
{button,i, div, ul, li, input, form, h2} = React.DOM

@ProjectForm = React.createClass

  getInitialState: ->
    name: ''

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
        'Create project'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {project: @state}, (data) =>
      @props.handleNewProject data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
      @state.name

