
{button, fieldset, legend, input, form} = React.DOM

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
    form
      className: 'pure-form'
      onSubmit: @handleSubmit
      fieldset
        legend
          null
          'Projects'
        input
          type: 'text'
          placeholder: 'Project'
          name: 'name'
          value: @state.name
          onChange: @handleChange
        button
          type: 'submit'
          className: 'pure-button pure-button-primary'
          disabled: !@valid()
          'Create project'

