view: products_new {
  sql_table_name: `eastern-surface-396610.surebright_products_dataset.products_new` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }
  dimension: image1 {
    type: string
    sql: ${TABLE}.image1 ;;
  }
  dimension: image2 {
    type: string
    sql: ${TABLE}.image2 ;;
  }
  dimension: image3 {
    type: string
    sql: ${TABLE}.image3 ;;
  }
  dimension: images {
    type: string
    sql: ${TABLE}.images ;;
  }
  dimension: options {
    type: string
    sql: ${TABLE}.options ;;
  }
  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }
  dimension_group: published {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.published_at ;;
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
  dimension: sb_store_id {
    type: string
    sql: ${TABLE}.sb_store_id ;;
  }
  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
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
  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
