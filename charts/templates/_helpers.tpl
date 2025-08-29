
{{- define "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.fullname" -}}
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


{{- define "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.labels" -}}
helm.sh/chart: {{ include "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.chart" . }}
{{ include "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo584ac305-f336-48d3-b7a8-9b7d2d0e36cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}