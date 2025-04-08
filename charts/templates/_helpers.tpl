
{{- define "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.fullname" -}}
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


{{- define "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.labels" -}}
helm.sh/chart: {{ include "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.chart" . }}
{{ include "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8765ab7a-8f05-4ed3-b763-b7cb5f6bfe54.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}