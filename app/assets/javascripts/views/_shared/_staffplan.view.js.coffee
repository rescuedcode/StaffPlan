class StaffPlan.View extends Support.CompositeView
  render: ->
    @$el.empty()
    
    @$el.html StaffPlan.Templates.Layouts.application
      currentUserId: StaffPlan.currentUser.id
