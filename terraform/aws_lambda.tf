resource "aws_lambda_function" "ark-server-bot" {
  filename      = "files/handler.py.zip"
  function_name = "ark-server-bot"
  role          = aws_iam_role.whl-basic-lambda.arn
  handler       = "handler.run"

  source_code_hash = filebase64sha256("files/handler.py.zip")

  runtime = "python3.9"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      last_modified,
      source_code_hash,
      environment
    ]
  }
}
