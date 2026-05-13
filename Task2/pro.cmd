helm upgrade --install prometheus-adapter prometheus-community/prometheus-adapter ^
  --set prometheus.url=http://prometheus-server ^
  --set prometheus.port=80 ^
  --set plugin.logLevel=6