class window.StaffPlan.Views.Projects.Index extends Support.CompositeView
  className: "list padding-top-120"
  
  initialize: ->
    _.extend @, StaffPlan.Mixins.Events.weeks
    m = moment()
    @startDate = m.utc().startOf('day').subtract('days', m.day() - 1).subtract('weeks', 1)
    @collection.bind "remove", () =>
      @render()

    key "left, right", (event) =>
      @dateChanged if event.keyIdentifier is "Left" then "previous" else "next"

    @debouncedRender = _.debounce(@render, 500)
    $(window).bind "resize", (event) =>
      @debouncedRender()

    @on "year:changed", (message) =>
      @yearChanged(parseInt(message.year, 10))
    
    @on "date:changed", (message) =>
      @dateChanged(message.action)
  leave: ->
    @off()
    @remove()
  
  events:
    "click div.controls a[data-action=delete]": "deleteProject"

  deleteProject: ->
    event.preventDefault()
    event.stopPropagation()
    projectId = $(event.target).data("project-id")
    deleteView = new window.StaffPlan.Views.Shared.DeleteModal
      model: @collection.get(projectId)
      collection: @collection
    @$el.append deleteView.render().el
    $('#delete_modal').modal
      show: true
      keyboard: true
      backdrop: 'static'

  leave: ->
    $('body div.highlighter').remove()
    Support.CompositeView.prototype.leave.call @
  render: ->

    @numberOfBars = Math.floor( ($('section.main').width() - 280) / 40 )

    @$el.html StaffPlan.Templates.Projects.index.header

    if StaffPlan.relevantYears.length > 2
      @yearFilter = new StaffPlan.Views.Shared.YearFilter
        years: StaffPlan.relevantYears
        parent: @
      @$el.find('div.date-paginator div.fixed-180').append @yearFilter.render().el
    @collection.each (project) =>
      view = new StaffPlan.Views.Projects.ListItem
        model: project
        start: @startDate
      @appendChild view
    dateRangeView = new StaffPlan.Views.DateRangeView
      collection: _.range(@startDate.valueOf(), @startDate.valueOf() + @numberOfBars * 7 * 86400 * 1000, 7 * 86400 * 1000)
    
    @renderChildInto dateRangeView, @$el.find("#date-target")
    
    @$el.append StaffPlan.Templates.Projects.index.actions.addProject

    # m = moment()
    # timestampAtBeginningOfWeek = m.utc().startOf('day').subtract('days', m.day() - 1)
    # _.delay () ->
    #   $("*[data-timestamp=\"#{timestampAtBeginningOfWeek}\"]").addClass("current-week-highlight")
    # , 100
    # _.delay () ->
    #   currentWeek = $("span.week-number[data-timestamp=\"#{timestampAtBeginningOfWeek.valueOf()}\"]")
    #   if currentWeek.length > 0
    #     highlighterView = new StaffPlan.Views.Shared.Highlighter
    #       offset:
    #         left: currentWeek.offset().left
    #         top: 38
    #       width: 35
    #       height: 1000 # FIXME This value should be computed
    #       zindex: -100
    #     if $('body div.highlighter').length is 0
    #       $('body').append highlighterView.render().el
    # , 100
    @
