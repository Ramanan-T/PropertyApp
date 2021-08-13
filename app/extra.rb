collection_action :addsubagents, method: :get do
    # Do some CSV importing work here...
    redirect_to add_agents, notice: "Sub agent Created"
  end
  action_item :addsubagents do
    link_to 'Add subagents', '/addsubagents'
  end