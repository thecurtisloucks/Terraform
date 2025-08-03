locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num if num % 2 == 0]
  firstnames     = [for obj in var.objects_list : obj.firstname]
  lastnames      = [for obj in var.objects_list : obj.lastname]
  fullnames      = [for person in var.objects_list : "${person.firstname} ${person.lastname}"]
}

output "doubles" {
  value = local.double_numbers
}

output "even_numbers" {
  value = local.even_numbers
}

output "firstnames" {
  value = local.firstnames
}

output "lastnames" {
  value = local.lastnames
}

output "fullnames" {
  value = local.fullnames
}
