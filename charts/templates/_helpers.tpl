
{{- define "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.fullname" -}}
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


{{- define "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.labels" -}}
helm.sh/chart: {{ include "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.chart" . }}
{{ include "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofea476ee-e4af-4112-9013-67f9b3405d3f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}