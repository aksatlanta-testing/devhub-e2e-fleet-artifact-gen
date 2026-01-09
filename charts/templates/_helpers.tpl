
{{- define "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.fullname" -}}
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


{{- define "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.labels" -}}
helm.sh/chart: {{ include "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.chart" . }}
{{ include "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo83ca9d79-59a0-4a89-9c41-9a5959d76440.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}