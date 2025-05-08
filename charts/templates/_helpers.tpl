
{{- define "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.fullname" -}}
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


{{- define "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.labels" -}}
helm.sh/chart: {{ include "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.chart" . }}
{{ include "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf2b2b3f-d1d3-4334-9144-a27b5c499b52.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}