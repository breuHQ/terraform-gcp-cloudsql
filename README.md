# CloudSQL module with instances, databases, and users

Opinionated terraform module to set up CloudSQL in GCP, containing an instance with databases, and users.

## Intputs

| Name                                   | Description                            | Type         | Default          | Required |     |
| -------------------------------------- | -------------------------------------- | ------------ | ---------------- | -------- | --- |
| instance_name                          | name of the cloud sql instance for gcp | string       |                  | yes      |
| settings\_\_tier                       | machine instance tiers types           | string       | db-custom-1-3840 | yes      | --- |
| db_flags                               | database flags options                 | map(objects) | yes              | yes      | --- |
| ip_configuration\_\_authorized_network | authorized_networks                    | map(objects) | yes              | yes      |
| ip_configuration\_\_private_network    | ip_configuration\_\_private_network    | string       | yes              | yes      |
| databases                              | databases you need in the instance     | list         | no               | yes      |

## Outputs

| Name | Description |
| ---- | ----------- |
