{
  postgres = {
    image = "postgres:17-alpine";
    environment = {
      POSTGRES_PASSWORD = "postgres";
      POSTGRES_USER = "postgres";
      POSTGRES_DB = "postgres";
    };
    ports = [ "5432:5432" ];
    volumes = [ "/var/lib/postgresql-data:/var/lib/postgresql/data" ];
  };
}
