## Quick Links

1. [Overview](#overview)
1. [Running the Container](#running-thecontainer)
1. [Running Scoutsuite](#running-scoutsuite)
    1. [Example Test](#example-test)
1. [Accessing the Report](#report-access)
1. [Cloud Configuration](#cloud-config)
    1. [AWS](#aws-config)
    1. [Google](#gcp-config)
    1. [Azure](#az-config)

<a name="overview" href="#"></a>

## Overview

This image is an Ubuntu based container that comes with all pre-requisite software required to run ScoutSuite. It's based on the Ubuntu 20.04 docker base. The version of ScoutSuite installed in the container is 5.10.2.

The following CLI tools are also installed:

* **AWS (version 2)**:

~~~bash
aws-cli/2.1.29 Python/3.8.8 Linux/4.19.121-linuxkit exe/x86_64.ubuntu.20 prompt/off
~~~

* **Azure**:

~~~bash
azure-cli                         2.20.0

core                              2.20.0
telemetry                          1.0.6

Python location '/opt/az/bin/python3'
Extensions directory '/root/.azure/cliextensions'

Python (Linux) 3.6.10 (default, Feb 26 2021, 06:44:23)
[GCC 10.2.0]
~~~

* **GCP**:

~~~bash
Google Cloud SDK 330.0.0
alpha 2021.02.26
app-engine-python 1.9.91
app-engine-python-extras 1.9.91
beta 2021.02.26
bq 2.0.65
core 2021.02.26
gsutil 4.59
~~~

* **IBM Cloud**

~~~bash
ibmcloud version 1.2.3+3577aee6-2020-09-25T14:34:09+00:00
~~~

----

<a name="running-thecontainer" href="#"></a>

## Running The Container

There are two ways to run the Docker image:

1. Grab the image from DockerHub and run it: `docker run -it rossja/stratus`
1. Build the container from this source:
   1. Clone the [GitHub Repo](https://github.com/rossja/stratus)
   1. Change to the `stratus/src` directory
   1. Run `./build.sh` to create the container
   1. Run the container using `docker run -it stratus`.

----

<a name="running-scoutsuite" href="#"></a>

## Running ScoutSuite

Once the CLI for the environment you are testing has been configured and the appropriate credentials set up you can run ScoutSuite in the container. When you run the container you're automatically logged in with the scoutsuite environment active. You should see that the command prompt reflects this virtual environment, with the name of the virtual environment (scoutsuite) preceding the root prompt: `(scoutsuite) root@1350ede02c47:~#`

If you need to manually restart the virtual environment, you can do this using the activate script in `/root/scoutsuite/bin/activate`:

~~~bash
root@1350ede02c47:~# source scoutsuite/bin/activate
(scoutsuite) root@1350ede02c47:~#
~~~

### Recommended Runtime Parameters

* Since this is a container, there's no GUI, and no browser, so passing the `--no-browser` probably makes sense.
* Likewise, setting a specific report directory using something like `--report-dir /root/scout-report` is a good idea. *(The default location is `$HOME/scoutsuite-report`)*

----

<a name="example-test" href="#"></a>

## Example Test

The example below demonstrates running scout against AWS, using the profile `scout-user01`, saving the report to the directory `/root/scout-report`:

~~~bash
scout aws --profile scout-user01 --no-browser --report-dir /root/scout-report
2020-01-03 17:45:16 460837197ae9 scout[7087] INFO Launching Scout
2020-01-03 17:45:16 460837197ae9 scout[7087] INFO Authenticating to cloud provider
2020-01-03 17:45:17 460837197ae9 scout[7087] INFO Gathering data from APIs
2020-01-03 17:45:17 460837197ae9 scout[7087] INFO Fetching resources for the Lambda service
2020-01-03 17:45:18 460837197ae9 scout[7087] INFO Fetching resources for the CloudFormation service
2020-01-03 17:45:18 460837197ae9 scout[7087] INFO Fetching resources for the CloudTrail service
2020-01-03 17:45:18 460837197ae9 scout[7087] INFO Fetching resources for the CloudWatch service
2020-01-03 17:45:18 460837197ae9 scout[7087] INFO Fetching resources for the Config service
2020-01-03 17:45:18 460837197ae9 scout[7087] INFO Fetching resources for the Direct Connect service
2020-01-03 17:45:19 460837197ae9 scout[7087] INFO Fetching resources for the EC2 service
2020-01-03 17:45:19 460837197ae9 scout[7087] INFO Fetching resources for the EFS service
2020-01-03 17:45:19 460837197ae9 scout[7087] INFO Fetching resources for the ElastiCache service
2020-01-03 17:45:20 460837197ae9 scout[7087] INFO Fetching resources for the ELB service
2020-01-03 17:45:21 460837197ae9 scout[7087] INFO Fetching resources for the ELBv2 service
2020-01-03 17:45:21 460837197ae9 scout[7087] INFO Fetching resources for the EMR service
2020-01-03 17:45:22 460837197ae9 scout[7087] INFO Fetching resources for the IAM service
2020-01-03 17:45:22 460837197ae9 scout[7087] INFO Fetching resources for the RDS service
2020-01-03 17:45:23 460837197ae9 scout[7087] INFO Fetching resources for the RedShift service
2020-01-03 17:45:23 460837197ae9 scout[7087] INFO Fetching resources for the Route53 service
2020-01-03 17:45:23 460837197ae9 scout[7087] INFO Fetching resources for the S3 service
2020-01-03 17:45:24 460837197ae9 scout[7087] INFO Fetching resources for the SES service
2020-01-03 17:45:24 460837197ae9 scout[7087] INFO Fetching resources for the SNS service
2020-01-03 17:45:24 460837197ae9 scout[7087] INFO Fetching resources for the SQS service
2020-01-03 17:45:24 460837197ae9 scout[7087] INFO Fetching resources for the VPC service
2020-01-03 17:46:13 460837197ae9 scout[7087] INFO Running rule engine
2020-01-03 17:46:15 460837197ae9 scout[7087] INFO Applying display filters
2020-01-03 17:46:16 460837197ae9 scout[7087] INFO Saving data to /root/scout-report/scoutsuite-results/scoutsuite_results_aws-scout-user01.js
2020-01-03 17:46:16 460837197ae9 scout[7087] INFO Saving data to /root/scout-report/scoutsuite-results/scoutsuite_exceptions_aws-scout-user01.js
2020-01-03 17:46:16 460837197ae9 scout[7087] INFO Creating /root/scout-report/aws-scout-user01.html
~~~

----

<a name="report-access" href="#"></a>

## Accessing Report Data

The report is stored in the directory specified with the `--report-dir` flag.

*Note: if this flag is omitted, the default is to create a `scoutsuite-report` directory in the directory the user is in at the time scout is run*.

### TL;DR

You can shortcut the process below by simply combining the `docker ps` command with the `docker cp` command like so:

~~~bash
docker cp $(docker ps -f ancestor=rossja/ncc-scoutsuite --format "{{.ID}}"):/root/scout-report ./
~~~

### Details

To copy the report data out of the running container, you can use the following process:

* On the docker host (not the container): run `docker ps` using a filter to find the container ID for the running instance of the container. An example of how to do this is shown below:

~~~bash
docker ps -f ancestor=rossja/ncc-scoutsuite --format "Container ID: {{.ID}}"
Container ID: a8d70ee4ced8
~~~

* Once you have the container ID, you can use the `docker cp` command to copy the report from the running container instance to your Docker host:

~~~bash
docker cp <container-id>:</path/to/report> </path/to/local/copy>
~~~

* For example, if the container ID is `a8d70ee4ced8`, and the report is stored in `/root/scout-report` on that container, the following command could be used to copy the report data from the container to the current directory:

~~~bash
docker cp a8d70ee4ced8:/root/scout-report ./
~~~

You can shortcut this process by simply combining the `docker ps` command with the `docker cp` command like so:

~~~bash
docker cp $(docker ps -f ancestor=rossja/ncc-scoutsuite --format "{{.ID}}"):/root/scout-report ./
~~~

----


## Viewing the Output File

The report itself can be viewed using a web browser, by opening the file `./scout-report/aws-<profile>.html`.

For example, if you ran the scout tool against AWS using the profile `scout-user01`, the report HTML file is at `./scout-report/aws-scout-01.html`.

**NOTES**:

**AWS**: If you used the default AWS profile credentials, the profile name is the numerical ID portion of the ARN for the user, rather than a specific profile or user name.

**GCP**: The scout report will be named using the project ID that was passed in.

----

<a name="cloud-config" href="#"></a>

# Cloud Configuration

This section contains some useful information on how to configure the various cloud service providers, specifically as they relate to provisioning accounts that can be used by ScoutSuite.

<a name="aws-config" href="#"></a>

## AWS

This section defines how to configure AWS with a minimal ScoutSuite configuration policy. See also: the ScoutSuite Wiki [AWS Policy Page](https://github.com/nccgroup/ScoutSuite/wiki/AWS-Minimal-Privileges-Policy)

### IAM Configuration

#### Policy Setup Using AWS Web Console

1. Login to AWS Web Console
2. Go to: IAM -> Policies
3. Click on "Create Policy"
4. Click the "JSON" tab
5. Replace the contents of the JSON Window with the policy statement below
6. Click on "Review Policy"
7. Give the Policy a name, and description
8. Click "Create Policy"

**example minimal JSON policy**

~~~json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "acm:DescribeCertificate",
        "acm:ListCertificates",
        "cloudformation:DescribeStacks",
        "cloudformation:GetStackPolicy",
        "cloudformation:GetTemplate",
        "cloudformation:ListStacks",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetEventSelectors",
        "cloudtrail:GetTrailStatus",
        "cloudwatch:DescribeAlarms",
        "cognito-identity:DescribeIdentityPool",
        "cognito-identity:ListIdentityPools",
        "cognito-idp:DescribeUserPool",
        "cognito-idp:ListUserPools",
        "config:DescribeConfigRules",
        "config:DescribeConfigurationRecorderStatus",
        "config:DescribeConfigurationRecorders",
        "directconnect:DescribeConnections",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeTable",
        "dynamodb:ListBackups",
        "dynamodb:ListTables",
        "dynamodb:ListTagsOfResource",
        "ec2:DescribeCustomerGateways",
        "ec2:DescribeFlowLogs",
        "ec2:DescribeImages",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeInstances",
        "ec2:DescribeNetworkAcls",
        "ec2:DescribeNetworkInterfaceAttribute",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeRegions",
        "ec2:DescribeRouteTables",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSnapshotAttribute",
        "ec2:DescribeSnapshots",
        "ec2:DescribeSubnets",
        "ec2:DescribeVolumes",
        "ec2:DescribeVpcPeeringConnections",
        "ec2:DescribeVpcs",
        "ec2:DescribeVpnConnections",
        "ec2:DescribeVpnGateways",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:GetLifecyclePolicy",
        "ecr:GetRepositoryPolicy",
        "ecr:ListImages",
        "ecs:DescribeClusters",
        "ecs:ListAccountSettings",
        "ecs:ListClusters",
        "eks:DescribeCluster",
        "eks:ListClusters",
        "elasticache:DescribeCacheClusters",
        "elasticache:DescribeCacheParameterGroups",
        "elasticache:DescribeCacheSecurityGroups",
        "elasticache:DescribeCacheSubnetGroups",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargetSecurityGroups",
        "elasticfilesystem:DescribeMountTargets",
        "elasticfilesystem:DescribeTags",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeLoadBalancerAttributes",
        "elasticloadbalancing:DescribeLoadBalancerAttributes",
        "elasticloadbalancing:DescribeLoadBalancerPolicies",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeSSLPolicies",
        "elasticloadbalancing:DescribeTags",
        "elasticloadbalancing:DescribeTags",
        "elasticmapreduce:DescribeCluster",
        "elasticmapreduce:ListClusters",
        "guardduty:GetDetector",
        "guardduty:ListDetectors",
        "iam:GenerateCredentialReport",
        "iam:GetAccountPasswordPolicy",
        "iam:GetCredentialReport",
        "iam:GetGroup",
        "iam:GetGroupPolicy",
        "iam:GetLoginProfile",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRole",
        "iam:GetRolePolicy",
        "iam:GetUserPolicy",
        "iam:ListAccessKeys",
        "iam:ListAttachedRolePolicies",
        "iam:ListEntitiesForPolicy",
        "iam:ListGroupPolicies",
        "iam:ListGroups",
        "iam:ListGroupsForUser",
        "iam:ListInstanceProfilesForRole",
        "iam:ListMFADevices",
        "iam:ListPolicies",
        "iam:ListRolePolicies",
        "iam:ListRoleTags",
        "iam:ListRoles",
        "iam:ListUserPolicies",
        "iam:ListUserTags",
        "iam:ListUsers",
        "iam:ListVirtualMFADevices",
        "kms:DescribeKey",
        "kms:GetKeyPolicy",
        "kms:GetKeyRotationStatus",
        "kms:ListAliases",
        "kms:ListGrants",
        "kms:ListKeys",
        "lambda:GetFunctionConfiguration",
        "lambda:GetPolicy",
        "lambda:ListFunctions",
        "logs:DescribeMetricFilters",
        "rds:DescribeDBClusterSnapshotAttributes",
        "rds:DescribeDBClusterSnapshots",
        "rds:DescribeDBClusters",
        "rds:DescribeDBInstances",
        "rds:DescribeDBParameterGroups",
        "rds:DescribeDBParameters",
        "rds:DescribeDBSecurityGroups",
        "rds:DescribeDBSnapshotAttributes",
        "rds:DescribeDBSnapshots",
        "rds:DescribeDBSubnetGroups",
        "rds:ListTagsForResource",
        "redshift:DescribeClusterParameterGroups",
        "redshift:DescribeClusterParameters",
        "redshift:DescribeClusterSecurityGroups",
        "redshift:DescribeClusters",
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "route53domains:ListDomains",
        "s3:GetBucketAcl",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketPolicy",
        "s3:GetBucketTagging",
        "s3:GetBucketVersioning",
        "s3:GetBucketWebsite",
        "s3:GetEncryptionConfiguration",
        "s3:ListAllMyBuckets",
        "secretsmanager:ListSecrets",
        "secretsmanager:DescribeSecret",
        "ses:GetIdentityDkimAttributes",
        "ses:GetIdentityPolicies",
        "ses:ListIdentities",
        "ses:ListIdentityPolicies",
        "ssm:DescribeParameters",
        "ssm:GetParameters",
        "sns:GetTopicAttributes",
        "sns:ListSubscriptions",
        "sns:ListTopics",
        "sqs:GetQueueAttributes",
        "sqs:ListQueues"
      ],
      "Resource": "*"
    }
  ]
}
~~~

#### Assigning the Policy to a User

1. In AWS IAM click on "Users"
2. Create a new user: an example username could be: `scout-user01`
3. Click on "Programmatic Access", then click "Next"
4. Click on the "Attach existing policies directly" tab
5. Search for the Policy created above and select it
6. Click on "Next:Tags"
7. Add any applicable tags. For example: `role: scoutsuite`
8. Click on "Next:Review"
9. Click on "Create User"
10. **CRITICAL**: Click on "Download .csv". Name the CSV something meaningful. Example: `aws-scout-user01`. If this file is not preserved, the secret key will be lost with no way to recover it. You will need the keys contained in this file to set up the AWS CLI environment ScoutSuite uses.

### AWS CLI Credential Management

#### Using Default Profile Only

The AWS credentials created get stored in the home directory of the user: in this container that means root. Look for the `config` and `credentials` files in `$HOME/.aws`. The examples below show how these files might look after setting up a default user profile only:

* config example:

~~~INI
[default]
region = us-east-1
output = json
~~~

* credentials example:

~~~INI
[default]
aws_access_key_id = <access-key>
aws_secret_access_key = <secret key>
~~~

#### Using Multiple AWS Profiles

If you need to create specific profiles, you can do this by passing the `--profile` flag to the config command of the AWS CLI.
You can also simply edit the config and credentials files. For example, to create a profile called `scout-user01` in addition to the default profile, you could use the following config and credentials files:

* config example:

~~~INI
[default]
region = us-east-1
output = json

[profile scout-user01]
region = us-east-1
output = json
~~~

* credentials example:

~~~INI
[default]
aws_access_key_id = <access-key>
aws_secret_access_key = <secret key>

[scout-user01]
aws_access_key_id = <access-key>
aws_secret_access_key = <secret key>
~~~

### Verification of Credentials

To test that the AWS CLI credentials have been set up correctly, you can run any of the commands available to the user you have set up. For example, to list the IAM users:

 `aws iam list-users` (or `aws --profile <profile-name> iam list-users` if you are using multiple profiles)

You should see output similar to the following:

~~~json
{
    "Users": [
        {
            "Path": "/",
            "UserName": "user01",
            "UserId": "AIDAIUZF4IL2CAWNIBRC4",
            "Arn": "arn:aws:iam::758548986810:user/user01",
            "CreateDate": "2018-10-22T22:10:22+00:00"
        },
        {
            "Path": "/",
            "UserName": "user02",
            "UserId": "AIDAI5XVDDRXPSIVEZJGS",
            "Arn": "arn:aws:iam::758548986810:user/user02",
            "CreateDate": "2019-04-20T05:31:46+00:00"
        }
    ]
}
~~~

### Testing AWS With ScoutSuite

You can run scoutsuite either using the default AWS profile, or a specific profile:

* To run using the default profile, simply run `scout aws --no-browser`.
* To use a specific profile use the --profile flag: `scout aws --profile <profile-name> --no-browser`.

----

<a name="gcp-config" href="#"></a>

## Google

### Assigning GCP privileges

1. Create a user in the Google Cloud console, in the project that will be tested.
2. Assign the following roles to the user: `Viewer, `Security Reviewer`, `Stackdriver Account
Viewer`.
3. Additionally, you may need to assign the following using <https://console.developers.google.com/
iam-admin/iam/project?project=[project-id]>:
  * `serviceusage.services.use` for the project
  * `storage.buckets.getIamPolicy` for all buckets that should be reviewed
4. Ensure that the `cloud resource manager API` is enabled for the project that will be tested.
5. If the project uses KMS, ensure that the `Cloud Key Management Service (KMS) API` is
enabled.

### Configuring the gCloud SDK

Once the user is created and permissions assigned, you need to obtain credentials for GCP. One way to do this is to login to GCP using the SDK auth method:

1. Run the command `gcloud auth application-default login`. This will provide a URL that you need to paste into a browser.
2. Login to the Google account that has the required privileges, and you will see a verification code that you need to enter at the command prompt.
3. Enter the verification code at the gcloud prompt. This will add the credentials to the gcloud json file.

An example of this process is shown below:

~~~shell
gcloud auth application-default login

Go to the following link in your browser:
    https://accounts.google.com/o/oauth2/auth?code_challenge=[snipped]
Enter verification code: <code>

Credentials saved to file: [/root/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).
~~~

### Testing GCP With ScoutSuite

Running scoutsuite can be done using something like the following:

`scout gcp -u --project-id <project-id> --no-browser`

<a name="az-config" href="#"></a>

## Azure

### Permissions Setup

1. Create a user in the desired directory
2. Grant the given user the role of `Global Reader` in the directory
3. Add the user to the desired subscription, with both Reader and Security Reader roles

## Configuring the Azure CLI

In the container run `az login -u <user> -p <pass> -t <tenantId>`

### Testing Azure With ScoutSuite

Running scoutsuite can be done using something like the following:

`scout azure --cli --no-browser`


