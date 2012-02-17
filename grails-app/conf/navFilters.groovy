/**
 *
 * @author Balzaar / Kawakisan
 */
class navFilters {
    def filters = {
        currentNav(controller: '*', action: '*') {
            before = {
                session.currentNav = "${controllerName}${actionName}"
                return true
            }
        }
    }
}