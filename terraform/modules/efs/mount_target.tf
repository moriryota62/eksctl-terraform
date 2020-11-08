resource "aws_efs_mount_target" "private_subnet_0" {
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.private_subent_id_0
  security_groups = [aws_security_group.allow_efs.id]
}

resource "aws_efs_mount_target" "private_subnet_1" {
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.private_subent_id_1
  security_groups = [aws_security_group.allow_efs.id]
}