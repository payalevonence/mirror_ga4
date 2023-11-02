view: test {
  sql_table_name: `quote_dataset.Test` ;;

  dimension: item_id {
    type: string
    sql: ${TABLE}.ItemId ;;
  }
  measure: count {
    type: count
  }
}
