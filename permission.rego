package permission

import data.role_permissions

default allow = false

allow {
    role := input.roles[_]
    permission := role_permissions[role]
    allowedActions := permission[input.object]
    allowedActions[_] = input.action
}
