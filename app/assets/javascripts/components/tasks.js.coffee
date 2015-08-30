
{button,i, div, ul, li, input, form, h4} = React.DOM

@Tasks = React.createClass

  getInitialState: ->
    tasks: @props.project.tasks

  getDefaultProps: ->
    tasks: []

  addTask: (task) ->
    tasks = @state.tasks.slice()
    tasks.push task
    @setState tasks: tasks

  deleteTask: (task) ->
    tasks = @state.tasks.slice()
    index = tasks.indexOf task
    tasks.splice index, 1
    @replaceState tasks: tasks

  render: ->
    div
      className: 'tasks-in'
      h4
        className: 'title'
        'Tasks'

      React.createElement TaskForm, handleNewTask: @addTask, project: @props.project

      div
        className: 'task'
        for task in @state.tasks
          React.createElement Task,
                              key: task.id,
                              task: task,
                              project: @props.project,
                              handleDeleteTask: @deleteTask,
                              handleChangeStatus: @changeStatus
