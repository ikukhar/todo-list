
{div} = React.DOM

@Projects = React.createClass

  getInitialState: ->
    projects: @props.projects

  getDefaultProps: ->
    projects: []

  addProject: (project) ->
    projects = @state.projects.slice()
    projects.push project
    @setState projects: projects

  deleteProject: (p) ->
    projects = @state.projects.slice()
    index = projects.indexOf p
    projects.splice index, 1
    @replaceState projects: projects


  render: ->
    div
      className: ''

      React.createElement ProjectForm, handleNewProject: @addProject
