
{{- define "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.fullname" -}}
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


{{- define "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.labels" -}}
helm.sh/chart: {{ include "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.chart" . }}
{{ include "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo43faa5fb-fe9d-464f-b58e-7d3c6b59f32b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}