package system.authz

import rego.v1
import data.app_list

secret_key := "opaSecretKey"

default allow := {
	"allowed": false,
	"reason": "identity invalid",
}

allow := {"allowed": true} if {
    [status, _, payload] := io.jwt.decode_verify(input.identity, {"secret" : secret_key})
    status == true

    app := app_list[_]
    app == payload.app
}

allow := {"allowed": false, "reason": reason} if {
	not input.identity
	reason := "no identity provided"
}
