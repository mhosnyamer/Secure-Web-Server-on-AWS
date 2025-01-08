output "key_name" {
  value = aws_key_pair.key_pair.key_name
}

output "public_key" {
  value = aws_key_pair.key_pair.public_key
}

output "key_id" {
  value = aws_key_pair.key_pair.key_pair_id
}