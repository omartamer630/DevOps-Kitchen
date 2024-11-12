# Get Access key of mostafa
output "mostafa-access-key-output" {
  value = aws_iam_access_key.mostafa-access-key.id
}
# Get secret key of mostafa with mask it from logs
output "mostafa-secret-key-output" {
  value = aws_iam_access_key.mostafa-access-key.secret
  sensitive = true 
}
# Get Access key of taha
output "taha-access-key-output" {
  value = aws_iam_access_key.taha-access-key.id
}
# Get secret key of taha with mask it from logs
output "taha-secret-key-output" {
  value = aws_iam_access_key.taha-access-key.secret
  sensitive = true 
}
