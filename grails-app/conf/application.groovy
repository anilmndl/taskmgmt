// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'taskmgmt.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'taskmgmt.UserRole'
grails.plugin.springsecurity.authority.className = 'taskmgmt.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"

grails.plugin.springsecurity.interceptUrlMap = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll'],],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],

        [pattern: '/login/**', access: ['permitAll']],
        [pattern: '/logout/**', access: ['permitAll']],

        // common files
        [pattern: '/customer/**', access: ['permitAll']],
        [pattern: '/task/**', access: ['permitAll']],

        // admin accessibility
        [pattern: '/**', access: ['ROLE_ADMIN']],

        // -------------------- user's accessibility -----------------------------//

        // user CRUD
        [pattern: '/user/list', access: ['ROLE_USER, ROLE_ADMIN']],
        [pattern: '/user/edit', access: ['ROLE_USER, ROLE_ADMIN']],
        [pattern: '/user/detail', access: ['ROLE_USER, ROLE_ADMIN']],

        // taskType CRUD
        [pattern: '/taskType/detail', access: ['ROLE_USER']],
        [pattern: '/taskType/list', access: ['ROLE_USER']],

        // role CRUD
        [pattern: '/role/detail', access: ['ROLE_USER']],
        [pattern: '/role/list', access: ['ROLE_USER']],


        // --------------------- end user's accessibility -------------------------//
]

