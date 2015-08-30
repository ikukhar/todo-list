
{button,i, div, ul, li, input, form, h4} = React.DOM

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
      className: 'projects'
      h4
        className: 'title'
        'Projects'

      React.createElement ProjectForm, handleNewProject: @addProject

      ul null,
        for project in @state.projects
          React.createElement Project,
                              key: project.id,
                              project: project,
                              handleDeleteProject: @deleteProject
