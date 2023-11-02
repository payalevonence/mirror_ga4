view: shopify_store_product_variants {
  sql_table_name: `eastern-surface-396610.store_products_dataset.shopifyStoreProductVariants` ;;

  dimension: average_variant_price {
    type: string
    sql: ${TABLE}.averageVariantPrice ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdAt ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: document_version {
    type: string
    sql: ${TABLE}.documentVersion ;;
  }
  dimension: is_policy_enabled {
    type: string
    sql: ${TABLE}.isPolicyEnabled ;;
  }
  dimension: is_policy_prices_ca {
    type: yesno
    sql: ${TABLE}.isPolicyPricesCA ;;
  }
  dimension: is_policy_prices_us {
    type: yesno
    sql: ${TABLE}.isPolicyPricesUS ;;
  }
  dimension: is_policy_selection_rule_list_ca {
    type: yesno
    sql: ${TABLE}.isPolicySelectionRuleListCA ;;
  }
  dimension: is_policy_selection_rule_list_us {
    type: yesno
    sql: ${TABLE}.isPolicySelectionRuleListUS ;;
  }
  dimension: list_price {
    type: string
    sql: ${TABLE}.listPrice ;;
  }
  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }
  dimension: policy_details_cainsurer_category {
    type: string
    sql: ${TABLE}.policyDetailsCAInsurerCategory ;;
  }
  dimension: policy_details_cainsurer_id {
    type: string
    sql: ${TABLE}.policyDetailsCAInsurerId ;;
  }
  dimension: policy_details_cashopify_store_policy_product_ref {
    type: string
    sql: ${TABLE}.policyDetailsCAshopifyStorePolicyProductRef ;;
  }
  dimension: policy_details_usinsurer_category {
    type: string
    sql: ${TABLE}.policyDetailsUSInsurerCategory ;;
  }
  dimension: policy_details_usinsurer_id {
    type: string
    sql: ${TABLE}.policyDetailsUSInsurerId ;;
  }
  dimension: policy_details_usshopify_store_policy_product_ref {
    type: string
    sql: ${TABLE}.policyDetailsUSshopifyStorePolicyProductRef ;;
  }
  dimension: policy_prices_casize {
    type: string
    sql: ${TABLE}.policyPricesCASize ;;
  }
  dimension: policy_prices_catenure {
    type: string
    sql: ${TABLE}.policyPricesCATenure ;;
  }
  dimension: policy_prices_ussize {
    type: string
    sql: ${TABLE}.policyPricesUSSize ;;
  }
  dimension: policy_prices_ustenure {
    type: string
    sql: ${TABLE}.policyPricesUSTenure ;;
  }
  dimension: policy_selection_rule_list_casize {
    type: string
    sql: ${TABLE}.policySelectionRuleListCASize ;;
  }
  dimension: policy_selection_rule_list_catenure {
    type: string
    sql: ${TABLE}.policySelectionRuleListCATenure ;;
  }
  dimension: policy_selection_rule_list_ussize {
    type: string
    sql: ${TABLE}.policySelectionRuleListUSSize ;;
  }
  dimension: policy_selection_rule_list_ustenure {
    type: string
    sql: ${TABLE}.policySelectionRuleListUSTenure ;;
  }
  dimension: policy_status {
    type: string
    sql: ${TABLE}.policyStatus ;;
  }
  dimension: policy_status_message {
    type: string
    sql: ${TABLE}.policyStatusMessage ;;
  }
  dimension: policy_tag {
    type: string
    sql: ${TABLE}.policyTag ;;
  }
  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }
  dimension: product_description {
    type: string
    sql: ${TABLE}.productDescription ;;
  }
  dimension: product_handle {
    type: string
    sql: ${TABLE}.productHandle ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.productId ;;
  }
  dimension: product_image {
    type: string
    sql: ${TABLE}.productImage ;;
  }
  dimension: product_title {
    type: string
    sql: ${TABLE}.productTitle ;;
  }
  dimension: published_scope {
    type: string
    sql: ${TABLE}.publishedScope ;;
  }
  dimension: sb_manufacturer_name {
    type: string
    sql: ${TABLE}.sbManufacturerName ;;
  }
  dimension: sb_model_number {
    type: string
    sql: ${TABLE}.sbModelNumber ;;
  }
  dimension: shopify_category {
    type: string
    sql: ${TABLE}.shopifyCategory ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.storeName ;;
  }
  dimension: surebright_category {
    type: string
    sql: ${TABLE}.surebrightCategory ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedAt ;;
  }
  dimension: variant_id {
    type: string
    sql: ${TABLE}.variantId ;;
  }
  dimension: variant_title {
    type: string
    sql: ${TABLE}.variantTitle ;;
  }
  measure: count {
    type: count
    drill_fields: [store_name, sb_manufacturer_name]
  }
  measure: count_of_products {
    type: count_distinct
    sql: ${product_id} ;;
  }
}
