# README

## Whats not completed Or I would like to change
- I am missing a lot of test coverage but thats not a heavy lift.
- I would like to add some SERDE helpers for the protobuf enums as it causes a lot of duplication to lookup strings.
- I am not verifying any AUD or ISS claims in the JWT but this is a PoC so I feel ok with, it works, as a fair state.
- I don't like my nested serializer. I would like to change it such that I pass both object groups, inhabitants and the cage at the top level instead of allowing the serializer to execute a second query.
- I would like to convert params to parse requests into a protobuf so I an ensure types and make some inference on missing values.

## If this was to be deployed in a highly distributed env
- I would not use sqlite and instead consider a clusterable database with a read replica.
- I would consider using a distributed cache like redis to cache the JWKS keys.
- I would look into a message bus for writes. Something like kafka where I can collapse multiple writes and reconcile them into a single write. This allows for us to respect that all writes will be accepted even if they are out of order as well as guaranteeing that reads are as up to date as possible.
- I would continue to enhance my RBAC relying on JWT claims to identify permissions. Keeping the Policy Enforcement and Policy Decision Point as close to the code as possible. But as the code were to become more complex and ACLs become more complex we could move this to the ingress controller and pass constructed policies or security contexts with the reqest that are safe to propogate to other microserivces.

## Other thoughts

Overall this was pretty fun. I needed an outlet to test my assumptions around using protobuf in rails. I have previously used these in Java and Kotlin with great success. I am also currently working in a legacy system that cannot support stateless authz and this proves how simple it could be while enforcing a restrictive model of permissions at the controller.

My take away is I like protobuf but it might not be valueable without the use of a network protocol.

## Running this

Check out he Makefile thats where things should make sense.

I would start with installing ASDF then run:

`make asdf-setup`

This ensures you will have all the right tools at the right versions including ruby and protoc

Followed by

```bash
make setup
make migrate
make test
```

Which gets things bundled and the db ready as well as asserting everything is configured

finally

`make run`

boot the app and poke the endpoints.
