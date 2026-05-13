helm upgrade --install prometheus-adapter prometheus-community/prometheus-adapter ^
  --set prometheus.url=http://prometheus-server ^
  --set prometheus.port=80 ^
  --set "rules.default=true" ^
  --set "rules.custom[0].seriesQuery=http_requests_total" ^
  --set "rules.custom[0].resources.overrides.namespace.resource=namespace" ^
  --set "rules.custom[0].resources.overrides.pod.resource=pod" ^
  --set "rules.custom[0].name.matches=^(.*)_total" ^
  --set "rules.custom[0].name.as=http_requests_per_second" ^
  --set "rules.custom[0].metricsQuery=sum(rate(<<.Series>>{<<.LabelMatchers>>}[1m])) by (<<.GroupBy>>)"

helm upgrade --install prometheus-adapter prometheus-community/prometheus-adapter --set prometheus.url=http://prometheus-server --set prometheus.port=80 --set "rules.default=true" --set "rules.custom[0].seriesQuery=http_requests_total" --set "rules.custom[0].resources.template=<<.Resource>>" --set "rules.custom[0].resources.overrides.namespace.resource=namespace" --set "rules.custom[0].resources.overrides.pod.resource=pod" --set "rules.custom[0].name.matches=http_requests_total" --set "rules.custom[0].name.as=http_requests_per_second" --set "rules.custom[0].metricsQuery=sum(rate(<<.Series>>{<<.LabelMatchers>>}[1m])) by (<<.GroupBy>>)"

helm upgrade --install prometheus-adapter prometheus-community/prometheus-adapter ^
  --set prometheus.url=http://prometheus-server ^
  --set prometheus.port=80 ^
  --set extraArgs={--discovery-interval=30s,--metrics-relist-interval=30s} ^
  --set "rules.default=false" ^
  --set "rules.custom[0].seriesQuery=http_requests_total{pod!=''}" ^
  --set "rules.custom[0].resources.overrides.namespace.resource=namespace" ^
  --set "rules.custom[0].resources.overrides.pod.resource=pod" ^
  --set "rules.custom[0].name.matches=http_requests_total" ^
  --set "rules.custom[0].name.as=http_requests_per_second" ^
  --set "rules.custom[0].metricsQuery=sum(rate(<<.Series>>{<<.LabelMatchers>>}[1m])) by (<<.GroupBy>>)"