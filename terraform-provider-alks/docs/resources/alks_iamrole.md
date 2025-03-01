# Resource: alks_iamrole

Creates an custom ALKS IAM role for usage in an AWS account.

## Example Usage

### ALKS IAM Role Creation

```hcl
resource "alks_iamrole" "test_role" {
    name                     = "My_Test_Role"
    type                     = "Amazon EC2"
    include_default_policies = false
    enable_alks_access       = false
}
```

This will create a role with the exact name `My_Test_Role`.

### ALKS IAM Role Creation with Name Prefix

```hcl
resource "alks_iamrole" "test_role" {
    name_prefix              = "My_Test_Role_"
    type                     = "Amazon EC2"
    include_default_policies = false
    enable_alks_access       = false
}
```

This will create a role named similar to `My_Test_Role_20211103145836382400000001`.
This is useful to avoid name conflicts when using the same terraform in multiple regions.

### ALKS Dynamic Role Creation

```hcl
resource "alks_iamrole" "test_dynamic_role" {
    name                     = "my_dynamic_role"
    type                     = "Amazon EKS IRSA"
    include_default_policies = false
    enable_alks_access       = false
    template_fields          = {
        "OIDC_PROVIDER"       = "abc1234"
        "K8S_NAMESPACE"       = "default"
        "K8S_SERVICE_ACCOUNT" = "my-service-account"
    }
}
```

## Argument Reference

The following arguments are supported:

* `name` - (Optional/Computed) The name of the ALKS IAM role which will be reflected in AWS and the ALKS UI.
* `name_prefix` - (Optional/Computed) A prefix for a generated name of the ALKS IAM role which will be reflected in AWS and the ALKS UI.
* `type` - (Required) The role type to use. To see a list of available roles, [call this endpoint](https://pages.ghe.coxautoinc.com/ETS-CloudAutomation/ALKS-Documentation/#/aws-role-type-rest-service/getAllAwsRoleTypesUsingGET).
* `include_default_policies` - (Required) Whether or not the default manages policies should be attached to the role.
* `role_added_to_ip` - (Computed) Indicates whether or not an instance profile role was created.
* `arn` - (Computed) Provides the ARN of the role that was created.
* `ip_arn` - (Computed) If `role_added_to_ip` was `true` this will provide the ARN of the instance profile role.
* `enable_alks_access` - (Optional) If `true`, allows ALKS calls to be made by instance profiles or Lambda functions making use of this role. Note: This enables **machine identity** capability.
* `template_fields` - (Optional) If present, will submit template field data to ALKS.  Note: This will generate an error if the role type does not support template fields.

## Import

!> **Warning:** This will force-replace the resource.

ALKS IAM roles can be imported using the `name`, e.g.

```sh
terraform import alks_iamrole.test_role My_Test_Role
```