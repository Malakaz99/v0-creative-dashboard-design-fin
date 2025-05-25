project_name: "isracard_creative_analytics"

# Use local_dependency: To enable referencing of another project
# on this instance with include: statements

local_dependency: {
  project: "isracard_creative_analytics"
}

constant: VIS_LABEL {
  value: "Isracard Creative Analytics"
  export: override_optional
}

constant: CONNECTION_NAME {
  value: "creative_analytics_db"
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
