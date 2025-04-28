
{{- define "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.fullname" -}}
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


{{- define "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.labels" -}}
helm.sh/chart: {{ include "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.chart" . }}
{{ include "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobcf5631e-7145-4d25-9669-21c0a5f71380.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}