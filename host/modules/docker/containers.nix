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

  redpanda = {
    image = "docker.redpanda.com/redpandadata/redpanda:latest";
    cmd = [
      "redpanda"
      "start"
      "--smp"
      "1"
      "--reserve-memory"
      "0M"
      "--overprovisioned"
      "--node-id"
      "0"
      "--kafka-addr"
      "PLAINTEXT://0.0.0.0:29092,OUTSIDE://0.0.0.0:9092"
      "--advertise-kafka-addr"
      "PLAINTEXT://redpanda:29092,OUTSIDE://localhost:9092"
      "--pandaproxy-addr"
      "PLAINTEXT://0.0.0.0:28082,OUTSIDE://0.0.0.0:8082"
      "--advertise-pandaproxy-addr"
      "PLAINTEXT://redpanda:28082,OUTSIDE://localhost:8082"
    ];
    ports = [
      "8081:8081"
      "8082:8082"
      "9092:9092"
      "9644:9644"
      "28082:28082"
      "29092:29092"
    ];
    extraOptions = [
      "--network=my_network"
    ];
  };

  console = {
    image = "docker.redpanda.com/redpandadata/console:latest";
    environment = {
      KAFKA_BROKERS = "redpanda:29092";
      KAFKA_SCHEMAREGISTRY_ENABLED = "true";
      KAFKA_SCHEMAREGISTRY_URLS = "http://redpanda:8081";
      REDPANDA_ADMINAPI_ENABLED = "true";
      REDPANDA_ADMINAPI_URLS = "http://redpanda:9644";
    };
    ports = [
      "8080:8080"
    ];
    dependsOn = [ "redpanda" ];
    extraOptions = [
      "--network=my_network"
    ];
  };
}
