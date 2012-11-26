_templates =
  index:
    header: "<h3>List of users</h3>"
    actions:
      addUser: '''
        <div class="actions">
          <a href="/users/new" class="btn btn-primary" data-action="new">
            <i class="icon-list icon-white"></i>
            Add user
          </a>
        </div>
        '''
  listItem:
    userListItem: '''
    <li class="user-list-item list-item" data-user-id="{{user.id}}">
      <div class='user-info'>
        <a href="/users/{{user.id}}">
          <img alt="A69309561cecae0e0210ace5f6a9a585" class="gravatar" src="{{user.gravatar}}" />
          <span class='name'>
            <a href="/staffplans/{{user.id}}">{{user.first_name}} {{user.last_name}}</a>
          </span>
        </a>
      </div>
      <div class="controls">
        <a class="btn btn-info btn-small" data-action="show" data-user-id="{{user.id}}" href="/users/{{user.id}}">
          <i class="icon-white icon-leaf"></i>
          Show
        </a>
        <a class="btn btn-inverse btn-small" data-action="edit" data-user-id="{{user.id}}" href="/users/{{user.id}}/edit">
          <i class="icon-edit icon-white"></i>
          Edit
        </a>
        <a class="btn btn-danger btn-small" data-action="delete" data-user-id="{{user.id}}">
          <i class="icon-trash icon-white"></i>
          Delete
        </a>
      </div>
    </li>
    '''
  edit:
    userEdit: '''
    <div data-model=user>
      
      <div class="control-group">
        <label class="control-label" for="user_first_name">First name</label>
        <div class="controls">
          <input id="user_first_name" data-attribute=first_name size="30" type="text" value={{user.first_name}}>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="user_last_name">Last name</label>
        <div class="controls">
          <input id="user_last_name" data-attribute=last_name size="30" type="text" value={{user.last_name}}>
        </div>
     </div>

      <div class="control-group">
        <label class="control-label" for="user_email">Email</label>
        <div class="controls">
          <input id="user_email" data-attribute=email size="30" type="text" value="{{user.email}}">
        </div>
      </div>

    <div data-model=membership> 
      <div id="employment_status">
        <div class="control-group">
          <label class="control-label" for="user_employment_status">Employment status</label>
          <div class="controls">
            <select id="user_employment_status" data-attribute=employment_status>
              <option value="fte">Full-Time Employee</option>
              <option value="contractor">Contractor</option>
              <option value="intern">Intern</option>
            </select>
          </div>
        </div>
      </div>
      
      <div id="permissions">
        <div class="control-group">
          <label class="control-label checkbox" for="user_permissions_admin"></label>
          <div class="controls">
            <input id="user_permissions_admin" data-attribute=permissions type="checkbox" value="admin">Admin
          </div>
        </div>
        <div class="control-group">
          <label class="control-label checkbox" for="user_permissions_financials"></label>
          <div class="controls">
            <input id="user_permissions_financials" data-attribute=permissions type="checkbox" value="financials">Financials
          </div>
        </div>
      </div>


      <div id="salary_information">
        <div class="salary fte">
          <div class="control-group">
            <label class="control-label" for="user_salary">Salary</label>
            <div class="controls">
              <input id="user_salary" data-attribute=salary size="30" type="number">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="user_fte">Full-Time Equivalent</label>
            <div class="controls">
              <input id="user_full_time_equivalent" data-attribute=full_time_equivalent size="30" type="number">
            </div>
          </div>
        </div>
        
        <div class="salary contractor">
          
          <div class="control-group">
            <label class="control-label" for="user_weekly_allocation">Weekly allocation</label>
            <div class="controls">
              <input id="user_weekly_allocation" data-attribute=weekly_allocation size="30" type="number">
            </div>
          </div>

          <div class="control-group">
            <label class="control-label" for="user_payment_frequency">Payment frequency</label>
            <div class="controls">
              <select id="user_payment_frequency" data-attribute=payment_frequency>
                <option value="hourly">hourly</option>
                <option value="daily">daily</option>
                <option value="weekly">weekly</option>
                <option value="monthly">monthly</option>
                <option value="yearly">yearly</option>
              </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="user_rate">Rate</label>
            <div class="controls">  
              <input id="user_rate" data-attribute=rate size="30" type="number"></div>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="form-actions">
      <a href="#" data-action="update" type="submit" class="btn btn-primary">Update user</a>
      <a href="/users" data-action="cancel" type="button" class="btn">Back to list of users</a>
    </div>
    '''
  show:
    userInfo: '''
    <div class='user-profile'>
      <a href="/staffplans/{{user.id}}">
        <img alt="A69309561cecae0e0210ace5f6a9a585" class="gravatar" src="{{user.gravatar}}" />
      </a>
      <h3>Full Name</h3>
      <a href="/staffplans/{{user.id}}">
        <div class="user-name"> 
          <a href="/staffplans/{{user.id}}">{{user.full_name}}</a>
        </h3>
      </a>
      <h3>Email</h3>
      <div class='user-email'>
        {{user.email}}
      </div>
      <h3>List of projects</h3>
      <div class='user-projects'>
        {{#each projects}}
          <p class="user-projects-list-item">
            <a href="/projects/{{this.projectId}}">{{this.projectName}}</a>
          </p>
        {{/each}}
      </div>
    </div>
    <a class="btn btn-primary" href="/users">Back to list of users</a>
    '''
  new:
    userNew: '''
    <div data-model=user>
      <div class="control-group">
        <label class="control-label" for="user_first_name">First name</label>
        <div class="controls">
          <input id="user_first_name" data-attribute=first_name placeholder="First Name" size="30" type="text">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="user_last_name">Last name</label>
        <div class="controls">
          <input id="user_last_name" data-attribute=last_name placeholder="Last Name" size="30" type="text">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="user_email">Email</label>
        <div class="controls">
          <input id="user_email" data-attribute=email placeholder="user@host.tld" size="30" type="text">
        </div>
      </div>
    </div>

    <div data-model=membership>
      <div id="employment_status">
        <div class="control-group">
          <label class="control-label" for="user_employment_status">Employment status</label>
          <div class="controls">
            <select id="user_employment_status" data-attribute=employment_status>
              <option value="fte" selected="selected">Full-Time Employee</option>
              <option value="contractor">Contractor</option>
              <option value="intern">Intern</option>
            </select>
          </div>
        </div>
      </div>
      
      
      <div id="permissions">
        <div class="control-group">
          <label class="control-label" for="user_permissions_admin">Admin</label>
          <div class="controls">
            <input id="user_permissions_admin" data-attribute=permissions type="checkbox" value="admin">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="user_permissions_financials">Financials</label>
          <div class="controls">
            <input id="user_permissions_financials" data-attribute=permissions type="checkbox" value="financials">
          </div>
        </div>
      </div>


      <div id="salary_information">
        <div class="salary fte">
          <div class="control-group">
            <label class="control-label" for="user_salary">Salary</label>
            <div class="controls">
              <input id="user_salary" data-attribute=salary size="30" type="number">
            </div>
          </div>

          <div class="control-group">
            <label class="control-label" for="user_fte">Full-Time Equivalent</label>
            <div class="controls">
              <input id="user_fte" data-attribute=full_time_equivalent size="30" type="number">
            </div>
          </div>
        </div>

        <div class="salary contractor">
          <div class="control-group">
            <label class="control-label" for="user_weekly_allocation">Weekly allocation</label>
            <div class="controls">
              <input id="user_weekly_allocation" data-attribute=weekly_allocation size="30" type="number">
            </div>
          </div>
            
          <div class="control-group">
            <label class="control-label" for="user_payment_frequency">Payment frequency</label>
            <div class="controls">
              <select id="user_payment_frequency" data-attribute=payment_frequency>
                <option value="hourly">hourly</option>
                <option value="daily">daily</option>
                <option value="weekly">weekly</option>
                <option value="monthly">monthly</option>
                <option value="yearly">yearly</option>
              </select>
            </div>
          </div>
            
          <div class="control-group">
            <label class="control-label" for="user_rate">Rate</label>
            <div class="controls">
              <input id="user_rate" data-attribute=rate size="30" type="number"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-actions">
      <a href="/users" data-action="create" class="btn btn-primary">Create user</a>
      <a href="/users" data-action="cancel" class="btn">Back to list of users</a>
    </div>

    '''


StaffPlan.Templates.Users =
  new:
    newUser: Handlebars.compile _templates.new.newUser
  edit:
    userEdit: Handlebars.compile _templates.edit.userEdit
  show:
    userInfo: Handlebars.compile _templates.show.userInfo
  index:
    header: Handlebars.compile _templates.index.header
    actions:
      addUser: Handlebars.compile _templates.index.actions.addUser
  listItem:
    userListItem: Handlebars.compile _templates.listItem.userListItem
