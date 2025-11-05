
{{- define "go-echo74a37373-a0a0-49f0-8c41-583966936752.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74a37373-a0a0-49f0-8c41-583966936752.fullname" -}}
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


{{- define "go-echo74a37373-a0a0-49f0-8c41-583966936752.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo74a37373-a0a0-49f0-8c41-583966936752.labels" -}}
helm.sh/chart: {{ include "go-echo74a37373-a0a0-49f0-8c41-583966936752.chart" . }}
{{ include "go-echo74a37373-a0a0-49f0-8c41-583966936752.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo74a37373-a0a0-49f0-8c41-583966936752.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo74a37373-a0a0-49f0-8c41-583966936752.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}