
view: analysis_clyde {
  derived_table: {
    sql: SELECT distinct(s.deployment_url), p.title FROM `eastern-surface-396610.surebright_products_dataset.products` as p INNER JOIN `surebright_products_dataset.store` s on s.sb_store_id = p.sb_store_id where lower(title) like '%clyde%protection%' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: deployment_url {
    type: string
    sql: ${TABLE}.deployment_url ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  set: detail {
    fields: [
        deployment_url,
	title
    ]
  }
}
