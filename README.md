# Grafana & Loki

## Loki

Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost effective and easy to operate. It does not index the contents of the logs, but rather a set of labels for each log stream.

In the past, under Kubernetes, it was common to use the EFK stack with Elasticsearch.
However, for smaller K8S clusters, this setup can be resource-intensive and complex to manage. In such cases, choosing an alternative K8S monitoring solution with Grafana Loki as the core can be a more suitable option.

Like EFK, Loki originates from the Prometheus ecosystem and offers high availability and horizontal scalability.
The key difference is that Loki doesn’t index the entire log content but provides labels for each log.
This makes Loki lighter and requires fewer resources than traditional EFK stacks.

The differences between Loki and other monitoring solutions are as follows:

- It doesn’t index the entire log content, instead storing compressed, unstructured logs and indexing only the metadata. This results in a lighter and more cost-effective operation.
- It seamlessly transitions by utilizing the same indexes and labels already in use with Prometheus.
- Ideal for storing K8S Pod logs.
- Natively supported in Grafana v6.0 and later.
