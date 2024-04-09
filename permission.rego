package permission

import data.role_permissions 

default allow = false

allow {
    # print("input", input)
    # print("role_permissions", role_permissions)

    role := input.roles[_] 
    # print("Found role", role)
    
    permission := role_permissions[role] 
    # print("Found permissions", permission)

    allowedActions := permission[input.object]
    # print("Found allowedActions", allowedActions)

    allowedActions[_] = input.action    
}