
{button,i, div, ul, li, input, form, h2} = React.DOM

@Projects = React.createClass

  getInitialState: ->
    projects: @props.data

  getDefaultProps: ->
    projects: []

  addProject: (p) ->
    projects = @state.projects.slice()
    projects.push p
    @setState projects: projects

  deleteProject: (p) ->
    projects = @state.projects.slice()
    index = projects.indexOf p
    projects.splice index, 1
    @replaceState projects: projects


  render: ->
    div
      className: 'projects'
      h2
        className: 'title'
        'Projects'

      React.createElement ProjectForm, handleNewProject: @addProject

      ul null,
        for project in @state.projects
          React.createElement Project,
                              key: project.id,
                              project: project,
                              handleDeleteProject: @deleteProject
