
view: cps_analysis1 {
  derived_table: {
    sql: SELECT
          store.url  AS store_url,
          STRING_AGG(DISTINCT CAST(products.title  AS STRING), '|RECORD|') AS list_of_title
      FROM `eastern-surface-396610.surebright_products_dataset.products`  AS products
      INNER JOIN `eastern-surface-396610.surebright_products_dataset.store`  AS store ON products.sb_store_id = store.sb_store_id
      where lower(title) like '%cps%protection%'
      GROUP BY
          1
      ORDER BY
          1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: store_url {
    type: string
    sql: ${TABLE}.store_url ;;
  }

  dimension: list_of_title {
    type: string
    sql: ${TABLE}.list_of_title ;;
  }

  set: detail {
    fields: [
        store_url,
	list_of_title
    ]
  }
}
