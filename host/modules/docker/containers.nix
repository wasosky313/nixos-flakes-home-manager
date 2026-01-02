{
  postgres = {
    image = "postgres:17-alpine";
    environment = {
      POSTGRES_PASSWORD = "postgres";
      POSTGRES_USER = "postgres";
      POSTGRES_DB = "postgres";
    };
    ports = [ "5432:5432" ];
    volumes = [ "postgresql-data:/var/lib/postgresql/data" ];
  };

  jellyfin = {
    image = "jellyfin/jellyfin:latest";
    ports = [
      "8096:8096"   # HTTP web interface
      "8920:8920"   # HTTPS web interface (opcional)
      "7359:7359/udp"  # Client discovery
      "1900:1900/udp"  # Service discovery
    ];
    volumes = [
      "jellyfin-config:/config"
      "jellyfin-cache:/cache"
      "/home/media/movies:/media/movies:ro"
      "/home/media/series:/media/series:ro"
      "/home/media/disenhos:/media/disenhos:ro"
    ];
    environment = {
      PUID = "1000";
      PGID = "1000";
      TZ = "America/Sao_Paulo";
    };
    extraOptions = [
      "--hostname=wasa-server"
      "--device=/dev/dri:/dev/dri"  # Hardware acceleration (se disponível)
    ];
  };
}
