# 本レポジトリについて

EKSをeksctl + Terraformで構築するためのコード一式を格納しています。EKSの前提となるVPCをTerraformで構築します。EKS自体はeksctlを使用して構築します。なお、eksctlは内部的にCloudFormationを使用しています。

## すべてTerraformで作成しないのはなぜですか？
TerraformでもEKSを作成できます。
しかし、EKSのドキュメントではクラスタのバージョンアップ方法など、eksctlを前提とした手順が数多く案内されています。
また、EKSは本体以外にもオートスケールグループやIAMなど多くのリソースを同時に構成する必要があります。

terraformだとEKSに機能が追加されると新たにTerraformを記述する必要がある。（eksモジュール以外のコードが必要な場合もある）
eksctlならパラメータを追加して適用するだけで済む。

そのため、Terraformで管理するより、eksctlの方が運用面で迷いが少ないと考えました。
なお、eksctlでも構成情報をyamlで残すことができます。

## VPCも含めてすべてeksctlで作成しないのはなぜですか？
VPCはEKS以外のAWSサービスも使用したいかもしれません。たとえばRDSなどです。
EKSのみが関わる部分とEKS以外も関わる部分を分離しておいた方が、後に問題が起こりづらいと思います。
なので、本レポジトリではVPCはTerraform、EKSはeksctlで構築します。

# バージョンについて

以下のバージョンでの動作を確認しています。

- EKS 
  - eks : 1.18
  - eksctl : 0.30.0
- Terraform
  - Terraform    : v0.13.5
  - AWS provider : v3.12.0

# ドキュメント

より詳しい内容は以下のドキュメントを参照ください。

- [EKS構成について](./documents/configuration.md)
- [使い方](./documents/howtouse.md)
- [各モジュールの説明](./documents/module.md)

## ツールのインストール方法

### terraform

[こちら](https://learn.hashicorp.com/tutorials/terraform/install-cli)のHashiCorpドキュメントを参照ください。

### eksctl

[こちら](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/getting-started-eksctl.html)のAWSドキュメントを参照ください。