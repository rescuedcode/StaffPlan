class window.StaffPlan.Models.WeeklyAggregate extends Backbone.Model
  initialize: (options) =>
    # All the updating will be based on those two criteria
    @set "cweek",         options.cweek
    @set "year",          options.year
    @set "hasPassed",     options.hasPassed
    
    @set "totals",
      proposedActual:     if options.proposed then (parseInt( options.actual_hours, 10) || 0) else 0 
      proposedEstimated:  if options.proposed then (parseInt( options.estimated_hours, 10) || 0) else 0
      estimated:          parseInt(options.estimated_hours, 10) || 0
      actual:             parseInt(options.actual_hours, 10) || 0
     
  # Used to initialize the aggregate
  update: (week) ->
    @get("totals").estimated          += (parseInt( week.estimated_hours, 10) || 0)
    @get("totals").actual             += (parseInt( week.actual_hours, 10) || 0)
    @get("totals").proposedActual     += if week.proposed then (parseInt( week.actual_hours, 10) || 0) else 0
    @get("totals").proposedEstimated  += if week.proposed then (parseInt( week.estimated_hours, 10) || 0) else 0 
  
  # Used to update the aggregate (proposed bit is flipped, work week is updated)
  applyDelta: (delta) ->
    _.each ["estimated", "actual", "proposedActual", "proposedEstimated"] (attr) ->
      @get("totals")[attr] += delta[attr] || 0