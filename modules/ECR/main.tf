resource "aws_ecr_repository" "BACKEND" {
  name                 = var.BACKEND_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY

  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = var.BACKEND_REPOSITORY_NAME
    }
  )
}

resource "aws_ecr_repository" "FRONTEND" {
  name                 = var.FRONTEND_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY

  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = var.FRONTEND_REPOSITORY_NAME
    }
  )
}

resource "aws_ecr_repository" "DB" {
  name                 = var.DB_REPOSITORY_NAME
  image_tag_mutability = var.IMAGE_TAG_MUTABILITY

  image_scanning_configuration {
    scan_on_push = var.SCAN_ON_PUSH
  }

  tags = merge(
    var.COMMON_TAGS,
    {
      Name = var.DB_REPOSITORY_NAME
    }
  )
}