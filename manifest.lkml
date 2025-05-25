project_name: "isracard_creative_analytics"

# Allow this project to reference itself as a local dependency (not needed unless you're modularizing heavily)
# local_dependency is typically used to include **other** projects hosted in Looker
# So this line can be removed unless you're referencing another local project with the same name

# local_dependency: {
#   project: "isracard_creative_analytics"
# }

# Constants for global reuse
constant: VIS_LABEL {
  value: "Isracard Creative Analytics"
  export: override_optional
}

constant: CONNECTION_NAME {
  value: "creative_analytics_db"
  export: override_optional
}

# Caching policy for explores using this datagroup
datagroup: isracard_creative_analytics_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM creative_performance;;
  max_cache_age: "1 hour"
}

# Default persist_with for explores
persist_with: isracard_creative_analytics_default_datagroup

# Isracard brand color constants
constant: ISRACARD_TEAL {
  value: "#0070BA"
}

constant: ISRACARD_PINK {
  value: "#E91E63"
}

constant: ISRACARD_BLACK {
  value: "#000000"
}
