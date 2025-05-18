# terraform-study
『Google Cloud Platformで学ぶTerraform』  の基礎編をやっていきます

## gcloud のセットアップ

```sh
$ gcloud init

Welcome! This command will take you through the configuration of gcloud.

Settings from your current configuration [default] are:
core:
  account: sawady.dev@gmail.com
  disable_usage_reporting: 'False'
  project: corded-cinema-459811-g4

Pick configuration to use:
 [1] Re-initialize this configuration [default] with new settings 
 [2] Create a new configuration
Please enter your numeric choice:  2

Reauthentication required.
Please enter your password:
Reauthentication successful.
This account has no projects.

Would you like to create one? (Y/n)?  Y

Enter a Project ID. Note that a Project ID CANNOT be changed later.
Project IDs must be 6-30 characters (lowercase ASCII, digits, or
hyphens) in length and start with a lowercase letter. terraform-practice-book
Waiting for [operations/create_project.global.6102878980284815118] to finish...done.                                                             
Your current project has been set to: [terraform-practice-book].

Not setting default zone/region (this feature makes it easier to use
[gcloud compute] by setting an appropriate default value for the
--zone and --region flag).
See https://cloud.google.com/compute/docs/gcloud-compute section on how to set
default compute region and zone manually. If you would like [gcloud init] to be
able to do this for you the next time you run it, make sure the
Compute Engine API is enabled for your project on the
https://console.developers.google.com/apis page.

The Google Cloud CLI is configured and ready to use!

* Commands that require authentication will use masayoshi_sawada@sawady.dev by default
* Commands will reference project `terraform-practice-book` by default
Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [terraform-org]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the CLI like arg files and output formatting
* Run `gcloud cheat-sheet` to see a roster of go-to `gcloud` commands.
```

## 請求先アカウントの設定
Google Cloud Projectが作成されたので、Projectに請求先アカウントを設定する。

## サービスのAPIを有効化
事前に請求先アカウントが設定されていないと失敗する
```sh
$ gcloud services enable compute.googleapis.com
$ gcloud services enable storage-component.googleapis.com
$ gcloud services enable storage.googleapis.com
```

## tfenv 
```sh
$ tfenv --version
tfenv 3.0.0

$ terraform version
Terraform v1.11.4
on darwin_arm64

Your version of Terraform is out of date! The latest version
is 1.12.0. You can update by downloading from https://developer.hashicorp.com/terraform/install
```

