# IAM role for Lambda execution
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role-lambda" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Attach AWS managed policy for basic Lambda execution
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.role-lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Package the Lambda function code
data "archive_file" "zip-lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/lambda/lambda_function.zip"
}

# Lambda function
resource "aws_lambda_function" "lambda-terraform" {
  filename         = data.archive_file.zip-lambda.output_path
  function_name    = "lambda_terraform_actions"
  role             = aws_iam_role.role-lambda.arn
  handler          = "lambda_function.lambda_handler"

  runtime = "python3.12"

  environment {
    variables = {
      ENVIRONMENT = "dev"
      LOG_LEVEL   = "info"
    }
  }

  tags = {
    Environment = "dev"
    Application = "terraform-actions"
  }
}