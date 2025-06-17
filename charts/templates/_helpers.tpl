
{{- define "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.labels" -}}
helm.sh/chart: {{ include "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.chart" . }}
{{ include "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa99fbf6c-8054-4a25-8b2b-81c617fdb3ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}