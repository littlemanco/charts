{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{define "linkerd-ingress.name"}}{{default "linkerd-ingress" .Values.nameOverride | trunc 63 | trimSuffix "-" }}{{end}}

{{/*
Create a default fully qualified app name.

We truncate at 63 chars because some Kubernetes name fields are limited to this
(by the DNS naming spec).
*/}}
{{define "linkerd-ingress.fullname"}}
{{- $name := default "linkerd-ingress" .Values.nameOverride -}}
{{printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{end}}

{{/*
Provide a pre-defined claim or a claim based on the Release
*/}}
{{- define "linkerd-ingress.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else -}}
{{- template "linkerd-ingress.fullname" . }}
{{- end -}}
{{- end -}}

