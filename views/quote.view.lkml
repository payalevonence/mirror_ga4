view: quote {
  sql_table_name: `quote_dataset.quote` ;;
  drill_fields: [quote_id]

  dimension: quote_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.quoteId ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdAt ;;
  }
  dimension: is_yesterday {
    hidden: yes
    type: yesno
    sql: ${created_date} = DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY) ;;
  }
  dimension: is_last_month {
    hidden: yes
    type: yesno
    sql: ${created_date} = DATE_ADD(CURRENT_DATE(), INTERVAL -1 MONTH) ;;
  }
  dimension: insurer {
    type: string
    sql: ${TABLE}.insurer ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: policy_provider_category {
    type: string
    sql: ${TABLE}.policyProviderCategory ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.productId ;;
  }
  dimension: quote_item1_coverage_years {
    type: string
    sql: ${TABLE}.quoteItem1CoverageYears ;;
  }
  dimension: quote_item1_policy_price {
    type: string
    sql: ${TABLE}.quoteItem1PolicyPrice ;;
  }
  dimension: quote_item1_quote_item_id {
    type: string
    sql: ${TABLE}.quoteItem1QuoteItemId ;;
  }
  dimension: quote_item1_upper_price {
    type: string
    sql: ${TABLE}.quoteItem1UpperPrice ;;
  }
  dimension: quote_item2_coverage_years {
    type: string
    sql: ${TABLE}.quoteItem2CoverageYears ;;
  }
  dimension: quote_item2_policy_price {
    type: string
    sql: ${TABLE}.quoteItem2PolicyPrice ;;
  }
  dimension: quote_item2_quote_item_id {
    type: string
    sql: ${TABLE}.quoteItem2QuoteItemId ;;
  }
  dimension: quote_item2_upper_price {
    type: string
    sql: ${TABLE}.quoteItem2UpperPrice ;;
  }
  dimension: quote_item3_coverage_years {
    type: string
    sql: ${TABLE}.quoteItem3CoverageYears ;;
  }
  dimension: quote_item3_policy_price {
    type: string
    sql: ${TABLE}.quoteItem3PolicyPrice ;;
  }
  dimension: quote_item3_quote_item_id {
    type: string
    sql: ${TABLE}.quoteItem3QuoteItemId ;;
  }
  dimension: quote_item3_upper_price {
    type: string
    sql: ${TABLE}.quoteItem3UpperPrice ;;
  }
  dimension: store_name {
    type: string
    sql: ${TABLE}.storeName ;;
  }
  dimension: store_product_variant_price {
    type: string
    sql: ${TABLE}.storeProductVariantPrice ;;
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
  dimension: visit_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.visitId ;;
  }
  measure: count {
    type: count
    drill_fields: [quote_id, store_name, visit.visit_id]
  }
  measure: count_where_policy_price_is_null {
    type: count
    filters: [quote_item1_policy_price: "NULL"]
  }
  measure: count_where_policy_price_is_not_null {
    type: count
    filters: [quote_item1_policy_price: "-NULL"]
  }

  measure: count_of_quotes_displayed_yesterday {
    type: count
    filters: [
      quote_item1_policy_price: "-NULL",
      is_yesterday: "Yes"
      ]
  }

  measure: count_of_quotes_displayed_last_month {
    type: count
    filters: [
      quote_item1_policy_price: "-NULL",
      is_last_month: "Yes"
    ]
  }

  measure: count_of_products {
    type: count_distinct
    sql: ${product_id} ;;
  }

  measure: quote_item1_upper_price_measure {
    type: number
    sql: ${quote_item1_upper_price} ;;
  }

  measure: quote_item2_upper_price_measure {
    type: number
    sql: ${quote_item2_upper_price} ;;
  }

  measure: quote_item3_upper_price_measure {
    type: number
    sql: ${quote_item3_upper_price} ;;
  }

  #measure: Quote_fetched_Yesterday {
  #  type: count
  #  sql: ${count} ;;
  #  filters: [created_date: "Yesterday"]
  #}

  measure: Quote_fetched_Yesterday {
    type: count
    filters: {
      field: created_date
      value: "yesterday"
    }
  }


  measure: Quote_fetched_lastmonth {
    type: count
    filters: {
      field: created_date
      value: "last month"
    }

  }
  }

  #measure: Quote_fetched_lastmonth {
  #  type: count
  #  sql: ${count} ;;
  #  filters: [created_date: "last month"]
  #}
#}
