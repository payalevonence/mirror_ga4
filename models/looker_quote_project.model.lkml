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
  join: shopify_store_product_variants {
    type: inner
    sql_on: ${quote.store_name} = ${shopify_store_product_variants.store_name} ;;
    relationship: one_to_one
  }

}

explore: shopify_store_product_variants {
  join: quote {
    type: inner
    sql_on: ${quote.store_name} = ${shopify_store_product_variants.store_name} ;;
    relationship: one_to_one

  }
}

explore: product_tagging_shopifystoreproductvariants {}

explore: us_product_tagging_shopifystoreproductvariants {
  join: ca_product_tagging_shopifystoreproductvariants {
    type: inner
    sql_on: ${ca_product_tagging_shopifystoreproductvariants.store_name} = ${us_product_tagging_shopifystoreproductvariants.store_name} ;;
    relationship: one_to_one
  }

  join: shopify_store_product_variants {
    type: inner
    sql_on: ${shopify_store_product_variants.store_name} = ${us_product_tagging_shopifystoreproductvariants.store_name} ;;
    relationship: one_to_one
  }
}


explore: ca_product_tagging_shopifystoreproductvariants {}

explore: product__agging_shopifystoreproductvariants_ca {}

explore: analysis_clyde {}

explore: analysis_mulberry {}

explore: analysis_extend {}

explore: analysis_cps {}

explore: products_new {
  join: store_new {
    type: left_outer
    sql_on: ${products_new.sb_store_id} = ${store_new.sb_store_id};;
    relationship: one_to_one
  }

  join: variants {
    type: left_outer
    sql_on: ${products_new.sb_product_id} = ${variants.sb_product_id};;
    relationship: one_to_one
  }
}

explore: store_new {}

explore: variants {}

explore: products {
  join: store {
    type: inner
    sql_on: ${products.sb_store_id} = ${store.sb_store_id} ;;
    relationship: one_to_one
  }
}

explore: store {}

explore: mulberry_analysis1 {}
