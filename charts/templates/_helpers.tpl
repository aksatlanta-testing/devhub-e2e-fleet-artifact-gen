
{{- define "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.fullname" -}}
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


{{- define "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.labels" -}}
helm.sh/chart: {{ include "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.chart" . }}
{{ include "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbdfaf2d-bf1a-4ae8-b927-0bcc5f37e900.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}