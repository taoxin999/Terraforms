
# module "cloudwatch" {
#   count         = length(var.requests)
#   source        = "./modules/cloudwatch"
#   name_prefix   = "test-${var.requests[count.index].request_name}"
#   lambda_arn    = "arn:aws:lambda:us-east-1:695074329610:function:BBD-S3TriggerDemo"
#   schedule      = var.requests[count.index].schedule
#   event_pattern = var.requests[count.index].event_file_prefix == null ? null : <<EOL
#    {
#     "source": [ "aws.s3" ],
#     "detail-type": [ "Object Created" ],
#     "detail" : {
#       "bucket" : {
#         "name" : ["${local.batch_bucket_name}"]
#       },
#       "object" : {
#         "key" : [{
#           "prefix" : "${var.requests[count.index].event_file_prefix}"
#         }]
#       },
#       "reason" : ["PutObject"]
#     }
#   }
#   EOL
#   function_name = local.name_prefix
# }


# resource "aws_cloudwatch_event_rule" "event_rule" {
#   name        = "test-event-rule"
#   description = "EventBridge rule for test"
#   is_enabled  = true
#   #schedule_expression = var.schedule
#   event_pattern = <<PATTERN
#   {
#   "detail-type": ["Object Created"],
#   "source": ["aws.s3"],
#   "detail": {
#     "bucket": {
#       "name": ["pizza-luvrs-a-unique-string-tao"]
#     },
#     "object": {
#       "key": [{
#         "prefix": "test"
#       }]
#     },
#     "reason": ["PutObject"]
#   }
# }
# PATTERN
#   #tags          = merge(var.tags, { Name = "test-event-rule" })
# }

# resource "aws_cloudwatch_event_target" "lambda_event_target" {
#   arn       = "arn:aws:lambda:us-east-1:695074329610:function:BBD-S3TriggerDemo"
#   rule      = aws_cloudwatch_event_rule.event_rule.name
#   target_id = "test-event"
#   #input     = var.event_input
# }

# # resource "aws_lambda_permission" "allow_cloudwatch" {
# #   statement_id  = "${local.sid_prefix}CloudWatchTrigger"
# #   action        = "lambda:InvokeFunction"
# #   function_name = var.function_name
# #   principal     = "events.amazonaws.com"
# #   source_arn    = aws_cloudwatch_event_rule.event_rule.arn
# # }