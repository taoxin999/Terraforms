resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = "${var.name_prefix}-event-rule"
  description         = "EventBridge rule for ${var.name_prefix}"
  is_enabled          = true
  schedule_expression = var.schedule
  event_pattern       = var.event_pattern
#   event_pattern       = <<PATTERN
#   ${var.event_pattern}
#   PATTERN
  #tags                = merge(var.tags, { Name = "${var.name_prefix}-event-rule" })
}

resource "aws_cloudwatch_event_target" "lambda_event_target" {
  arn       = var.lambda_arn
  rule      = aws_cloudwatch_event_rule.event_rule.name
  target_id = "${var.name_prefix}-event"
  #input     = var.event_input
}