
{{- define "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.fullname" -}}
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


{{- define "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.labels" -}}
helm.sh/chart: {{ include "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.chart" . }}
{{ include "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb471c6d-81c2-4059-9d46-95e24cc48775.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}