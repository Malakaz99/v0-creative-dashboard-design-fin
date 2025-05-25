project_name: "isracard_creative_analytics"

# Include all LookML files
include: "/models/*.model.lkml"
include: "/views/*.view.lkml" 
include: "/dashboards/*.dashboard.lookml"

# Use local_dependency: To enable referencing of another project
local_dependency: {
  project: "isracard_creative_analytics"
}

constant: VIS_LABEL {
  value: "Isracard Creative Analytics"
  export: override_optional
}

constant: CONNECTION_NAME {
  value: "mad_bigquery"
  export: override_optional
}

# Datagroups define a caching policy for an Explore
datagroup: isracard_creative_analytics_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM creative_performance;;
  max_cache_age: "1 hour"
}

persist_with: isracard_creative_analytics_default_datagroup

# Color palette for Isracard branding
constant: ISRACARD_TEAL {
  value: "#0070BA"
}

constant: ISRACARD_PINK {
  value: "#E91E63"
}

constant: ISRACARD_BLACK {
  value: "#000000"
}
