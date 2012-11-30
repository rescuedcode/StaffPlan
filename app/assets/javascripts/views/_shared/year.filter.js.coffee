class StaffPlan.Views.Shared.YearFilter extends Backbone.View
  initialize: ->
    @years = @options.years
    @parent = @options.parent

  events:
    "change select.year-filter": "updateYearFilter"

  updateYearFilter: (event) ->
    year = $(event.target).val()
    localStorage.setItem "yearFilter", year
    @parent.trigger "year:changed",
      year: year

  render: ->
    @$el.html StaffPlan.Templates.Shared.yearFilter
      relevantYears: StaffPlan.relevantYears

    @$el.find('select.year-filter').val(localStorage.getItem("yearFilter") or 0)
    @