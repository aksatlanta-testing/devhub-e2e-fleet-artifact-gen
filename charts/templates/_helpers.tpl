
{{- define "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.fullname" -}}
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


{{- define "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.labels" -}}
helm.sh/chart: {{ include "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.chart" . }}
{{ include "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo858dcca8-ce54-4841-8c32-aefa0c57476d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}