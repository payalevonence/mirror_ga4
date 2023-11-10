view: variants {
  sql_table_name: `eastern-surface-396610.surebright_products_dataset.variants` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: compare_at_price {
    type: number
    sql: ${TABLE}.compare_at_price ;;
  }
  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }
  dimension: grams {
    type: number
    sql: ${TABLE}.grams ;;
  }
  dimension: option1 {
    type: string
    sql: ${TABLE}.option1 ;;
  }
  dimension: option2 {
    type: string
    sql: ${TABLE}.option2 ;;
  }
  dimension: option3 {
    type: string
    sql: ${TABLE}.option3 ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }
  dimension: requires_shipping {
    type: string
    sql: ${TABLE}.requires_shipping ;;
  }
  dimension_group: sb_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.sb_created_at ;;
  }
  dimension: sb_product_id {
    type: string
    sql: ${TABLE}.sb_product_id ;;
  }
  dimension: sb_variant_id {
    type: string
    sql: ${TABLE}.sb_variant_id ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: taxable {
    type: string
    sql: ${TABLE}.taxable ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
