dataSource {
    pooled = true
    autoreconnect = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = "org.h2.Driver"
            dbCreate = "create-drop"
            url = "jdbc:h2:mem:devDB"

//            dbCreate = "create-drop"
//            driverClassName = "com.mysql.jdbc.Driver"
//            url = "jdbc:mysql://localhost/skills"
//            username = "root"
//            password = "ax0nuk"
        }
    }
    test {
        dataSource {
	    driverClassName = "org.h2.Driver"
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb"
        }
    }
    production {
        dataSource {
            dialect = org.hibernate.dialect.MySQLInnoDBDialect
            driverClassName = "com.mysql.jdbc.Driver"
            username = "na"
            password = "na"
            url = "na"
            dbCreate = "update"

//            dbCreate = "create-drop"
//            driverClassName = "com.mysql.jdbc.Driver"
//            url = "jdbc:mysql://localhost/gigregister"
//            username = "root"
//            password = "ax0nuk"
        }
    }
}
