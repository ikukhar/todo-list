
{div} = React.DOM

@Tasks = React.createClass

  getInitialState: ->
    tasks: @props.project.tasks

  getDefaultProps: ->
    tasks: []

  addTask: (task) ->
    alert 'addTask'
    tasks = @state.tasks.slice()
    tasks.push task
    @setState tasks: tasks
    @props.handleChangeTasks

  deleteTask: (task) ->
    alert 'deleteTask'
    tasks = @state.tasks.slice()
    index = tasks.indexOf task
    tasks.splice index, 1
    @replaceState tasks: tasks
    @props.handleChangeTasks

  changeStatus: (e) ->
    alert 'changeStatus'
    @props.handleChangeTasks


  render: ->
    div
      className: ''

      for task in @state.tasks
        React.createElement Task,
                            key: task.id,
                            task: task,
                            project: @props.project,
                            handleDeleteTask: @deleteTask,
                            handleChangeStatus: @changeStatus

      React.createElement TaskForm, handleNewTask: @addTask, project: @props.project

