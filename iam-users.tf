resource "aws_iam_user" "rosa_adm" {
  name = "osdCcsAdmin"

  tags = merge(
    tomap({ "Name" = "iam_user_${var.tags["Application"]}_${var.tags["Environment"]}_oc-admin" }),
    tomap({ "Usage" = "give redhat permissions to deploy and manage openshift cluster on AWS" }),
    var.tags
  )
}


resource "aws_iam_access_key" "oc" {
  user = aws_iam_user.rosa_adm.name
}


resource "aws_iam_policy" "rosa_adm" {
  name        = "AdministratorAccess"
  description = "Rosa admin policy"
  policy      = file("./policies/administratoraccess.policy.json")
}


resource "aws_iam_user_policy_attachment" "rosa_adm" {
  user       = aws_iam_user.rosa_adm.name
  policy_arn = aws_iam_policy.rosa_adm.arn
}
