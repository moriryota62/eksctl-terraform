# common parameter
variable "tags" {
  description = "リソース群に付与する共通タグ"
  type        = map(string)
}

variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

# module parameter

variable "kms_id" {
  description = "暗号化に使用するKMSのARN"
  type        = string
}

variable "private_subent_id_0" {
  description = "EFSを接続するプライベートサブネットのID"
  type        = string
}

variable "private_subent_id_1" {
  description = "EFSを接続するプライベートサブネットのID"
  type        = string
}

variable "vpc_id" {
  description = "EFSへの接続を許可するVPCのID"
  type        = string
}

variable "vpc_cidr" {
  description = "EFSへの接続を許可するVPCのCIDR"
  type        = string
}