view: store_new {
  sql_table_name: `eastern-surface-396610.surebright_products_dataset.store_new` ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: deployment_url {
    type: string
    sql: ${TABLE}.deployment_url ;;
  }
  dimension: platform_type {
    type: string
    sql: ${TABLE}.platform_type ;;
  }
  dimension_group: sb_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.sb_created_at ;;
  }
  dimension: sb_store_id {
    type: string
    sql: ${TABLE}.sb_store_id ;;
  }
  dimension: store_type {
    type: string
    sql: ${TABLE}.store_type ;;
  }
  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }
  measure: count {
    type: count
  }
}
