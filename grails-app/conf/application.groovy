// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'taskmgmt.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'taskmgmt.UserRole'
grails.plugin.springsecurity.authority.className = 'taskmgmt.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"

grails.plugin.springsecurity.roleHierarchy = '''
   ROLE_ADMIN > ROLE_USER
'''

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

        // -------------------- user's accessibility -----------------------------//

        // common files
        [pattern: '/customer/**', access: ['ROLE_USER']],
        [pattern: '/task/**', access: ['ROLE_USER']],

        // user CRUD
        [pattern: '/user/list', access: ['ROLE_USER']],
        [pattern: '/user/edit/**', access: ['ROLE_USER']],
        [pattern: '/user/detail/**', access: ['ROLE_USER']],
        [pattern: '/user/vacation/**', access: ['ROLE_USER']],
        [pattern: '/user/subscribe/**', access: ['ROLE_USER']],
        [pattern: '/user/working/**', access: ['ROLE_USER']],

        // taskType CRUD
        [pattern: '/taskType/detail/**', access: ['ROLE_USER']],
        [pattern: '/taskType/list', access: ['ROLE_USER']],

        // role CRUD
        [pattern: '/role/detail/**', access: ['ROLE_USER']],
        [pattern: '/role/list', access: ['ROLE_USER']],


        // --------------------- end user's accessibility -------------------------//

        // -------------------- user's accessibility -----------------------------//

        // user CRUD
        [pattern: '/user/delete/**', access: ['ROLE_ADMIN']],
        [pattern: '/user/create/**', access: ['ROLE_ADMIN']],
        [pattern: '/user/save/**', access: ['ROLE_ADMIN']],

        // taskType CRUD
        [pattern: '/taskType/create/**', access: ['ROLE_ADMIN']],
        [pattern: '/taskType/edit/**', access: ['ROLE_ADMIN']],
        [pattern: '/taskType/assign/**', access: ['ROLE_ADMIN']],
        [pattern: '/taskType/delete/**', access: ['ROLE_ADMIN']],
        [pattern: '/taskType/save/**', access: ['ROLE_ADMIN']],

        // role CRUD
        [pattern: '/role/edit/**', access: ['ROLE_ADMIN']],
]

