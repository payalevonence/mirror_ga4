# If necessary, uncomment the line below to include explore_source.
# include: "looker_quote_project.model.lkml"

view: policy_provider_category_facts {
  derived_table: {
    explore_source: quote {
      column: policy_provider_category {}
      column: count {}
      filters: {
        field: quote.quote_item1_policy_price
        value: "-NULL"
      }
      derived_column: rank {
        sql: rank() over (order by count desc) ;;
      }
    }
  }
  dimension: policy_provider_category {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: rank {
    type: number
  }
  dimension: policy_provider_category_grouped {
    type: string
    sql:  case when ${rank} <=10 then ${policy_provider_category} else 'Other' end;;
    drill_fields: [policy_provider_category]
  }
}
