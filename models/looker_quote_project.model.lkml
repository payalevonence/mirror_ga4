connection: "quote_dataset"

# include all the views
include: "/views/**/*.view.lkml"
include: "/derived_tables/*.view.lkml"

datagroup: looker_quote_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_quote_project_default_datagroup

explore: test {}

explore: visit {}

explore: quote {
  join: visit {
    type: left_outer
    sql_on: ${quote.visit_id} = ${visit.visit_id} ;;
    relationship: many_to_one
  }
  join: policy_provider_category_facts {
    sql_on: ${quote.policy_provider_category} = ${policy_provider_category_facts.policy_provider_category} ;;
    relationship: many_to_one
  }
}

explore: shopify_store_product_variants {}

explore: product_tagging_shopifystoreproductvariants {}

explore: product__agging_shopifystoreproductvariants_ca {}
