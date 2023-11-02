view: visit {
  sql_table_name: `quote_dataset.visit` ;;
  drill_fields: [visit_id]

  dimension: visit_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.visitId ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createdAt ;;
  }
  dimension: ip_address {
    type: string
    sql: ${TABLE}.ipAddress ;;
  }
  dimension_group: last_visited {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.lastVisitedAt ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [visit_id, quote.count]
  }
}
