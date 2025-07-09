
# lifecycle config
resource "aws_s3_bucket_lifecycle_configuration" "forgtech-s3-lifecycle-config" {
  bucket = aws_s3_bucket.forgtech-bucket.id
  rule {
    id = "log-rule"
    filter {
      prefix = "log/"
    }
    status = "Enabled"
    transition {
      days = var.lifecycle-config[0].days
      storage_class = var.lifecycle-config[0].name
      }
    transition {
      days = var.lifecycle-config[1].days
      storage_class = var.lifecycle-config[1].name
    }
    transition {
      days = var.lifecycle-config[2].days
      storage_class = var.lifecycle-config[2].name
    }
    expiration {
      days = var.lifecycle-config[3].days
    }
  }
  rule {
    id = "outgoing-rule-notDeepArchive"
    filter {
      prefix = "outgoing/"
      tag {
      key = "notDeepArchive"
      value = "true"
      }
    }
    status = "Enabled"
    transition {
      days = var.lifecycle-config[0].days
      storage_class = var.lifecycle-config[0].name
      }
    transition {
      days = var.lifecycle-config[1].days
      storage_class = var.lifecycle-config[1].name
    }
    
  }
  rule {
    id = "incoming-rule"
    filter {
      prefix = "incoming/"
      object_size_greater_than = 1048576       # 1 MB in bytes
      object_size_less_than    = 1073741824    # 1 GB in bytes
    }
    status = "Enabled"
    transition {
      days = var.lifecycle-config[0].days
      storage_class = var.lifecycle-config[0].name
      }
    transition {
      days = var.lifecycle-config[1].days
      storage_class = var.lifecycle-config[1].name
    }
    
  }
  
}
