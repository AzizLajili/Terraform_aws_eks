# 1. Créer un secret dans Secrets Manager
resource "aws_secretsmanager_secret" "db_credentials" {
  name = "rds-db-credentials"

  description = "Credentials for the RDS database"
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = "dbadmin"        # Remplacez par votre nom d'utilisateur
    password = "strongpassword" # Remplacez par votre mot de passe sécurisé
  })
}