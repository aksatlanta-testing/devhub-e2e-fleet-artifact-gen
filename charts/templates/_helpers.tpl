
{{- define "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.fullname" -}}
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


{{- define "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.labels" -}}
helm.sh/chart: {{ include "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.chart" . }}
{{ include "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ea76119-42dc-4edb-bbdc-1e09c38c3cab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}