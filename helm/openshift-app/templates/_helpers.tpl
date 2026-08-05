{{/*
Expand the chart name.
*/}}
{{- define "openshift-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fully qualified app name.
*/}}
{{- define "openshift-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" (include "openshift-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart label.
*/}}
{{- define "openshift-app.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "openshift-app.labels" -}}
app.kubernetes.io/name: {{ include "openshift-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ include "openshift-app.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}